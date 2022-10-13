package hu.codeblurb.backend.controller.mapper;

import hu.codeblurb.backend.controller.dto.shoppingcart.MinimalContentBundleResponse;
import hu.codeblurb.backend.controller.dto.shoppingcart.MinimalContentResponse;
import hu.codeblurb.backend.controller.dto.shoppingcart.ShoppingItemResponse;
import hu.codeblurb.backend.service.dto.ContentBundleResult;
import hu.codeblurb.backend.service.dto.ContentResult;
import hu.codeblurb.backend.service.dto.ShoppingItemResult;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ShopMapper {

    MinimalContentBundleResponse map(ContentBundleResult contentBundleResult);

    MinimalContentResponse map(ContentResult contentResult);

    ShoppingItemResponse map(ShoppingItemResult shoppingItemResult);

    List<ShoppingItemResponse> mapShoppingItems(List<ShoppingItemResult> shoppingItemResultList);

}
