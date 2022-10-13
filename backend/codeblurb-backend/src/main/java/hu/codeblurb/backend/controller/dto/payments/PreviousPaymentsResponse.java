package hu.codeblurb.backend.controller.dto.payments;

import java.util.List;

public record PreviousPaymentsResponse(List<PaymentResponse> previousPayments) {
}
