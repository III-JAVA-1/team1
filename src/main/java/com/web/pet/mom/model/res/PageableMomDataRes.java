package com.web.pet.mom.model.res;

import com.web.pet.mom.model.req.MomData;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author i19
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class PageableMomDataRes {
    Integer currPage;

    Integer pageSize;

    List<MomData> momDataList;

    Integer totalDataSize;
}


