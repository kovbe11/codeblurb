import i18n from "@/i18n/i18nProvider";
import { QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import ReactDOM from "react-dom/client";
import { HelmetProvider } from "react-helmet-async";
import { I18nextProvider } from "react-i18next";
import { BrowserRouter } from "react-router-dom";
import App from "./App";
import "./index.css";
import { queryClient } from "./queryClient";

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
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
);
