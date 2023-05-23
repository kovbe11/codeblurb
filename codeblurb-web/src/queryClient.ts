import { QueryClient, QueryKey } from "@tanstack/react-query";

const defaultQueryFn = ({ queryKey }: { queryKey: QueryKey }) =>
  fetch(queryKey[0] as string);

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      queryFn: defaultQueryFn,
      refetchOnMount: false,
      retry: false,
    },
  },
});
