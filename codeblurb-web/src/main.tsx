import i18n from "@/i18n/i18nProvider";
import {
  QueryClient,
  QueryClientProvider,
  QueryKey,
} from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import ReactDOM from "react-dom/client";
import { HelmetProvider } from "react-helmet-async";
import { I18nextProvider } from "react-i18next";
import { BrowserRouter } from "react-router-dom";
import App from "./App";
import "./index.css";

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

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  // <React.StrictMode>
  <I18nextProvider i18n={i18n}>
    <QueryClientProvider client={queryClient}>
      <ReactQueryDevtools initialIsOpen={false} />
      <BrowserRouter>
        <HelmetProvider>
          <App />
        </HelmetProvider>
      </BrowserRouter>
    </QueryClientProvider>
  </I18nextProvider>
  // </React.StrictMode>
);
