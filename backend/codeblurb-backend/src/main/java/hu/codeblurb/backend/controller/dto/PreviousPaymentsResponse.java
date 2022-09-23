package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record PreviousPaymentsResponse(List<PaymentResponse> previousPayments) {
}
