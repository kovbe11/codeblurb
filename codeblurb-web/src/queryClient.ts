import { MutationCache, QueryClient, QueryKey } from "@tanstack/react-query";
import { toast } from "react-toastify";

const defaultQueryFn = ({ queryKey }: { queryKey: QueryKey }) =>
  fetch(queryKey[0] as string);

const mutationCache = new MutationCache({
  onError() {
    const mutation = arguments[3];
    if (
      mutation.options.meta?.showToast === false ||
      mutation.options.meta?.showErrorToast === false
    )
      return;
    toast(mutation.options.meta?.errorMessage ?? "Something went wrong!", {
      type: "error",
    });
  },
  onSuccess() {
    const mutation = arguments[3];
    if (
      mutation.options.meta?.showToast === false ||
      mutation.options.meta?.showSuccessToast === false
    )
      return;

    toast(mutation.options.meta?.successMessage ?? "Success!", {
      type: "success",
    });
  },
});

export const queryClient = new QueryClient({
  mutationCache,
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      queryFn: defaultQueryFn,
      refetchOnMount: false,
      retry: false,
    },
  },
});
