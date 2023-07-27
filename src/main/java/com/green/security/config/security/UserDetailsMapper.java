package com.green.security.config.security;

import com.green.security.config.security.model.MyUserDetails;
import com.green.security.config.security.model.UserEntity;
import com.green.security.config.security.model.UserTokenEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDetailsMapper {
    int save(UserEntity p);
    UserEntity getByUid(String uid);


    int updUserToken(UserTokenEntity p);
    UserTokenEntity selUserToken(UserTokenEntity p);
}
