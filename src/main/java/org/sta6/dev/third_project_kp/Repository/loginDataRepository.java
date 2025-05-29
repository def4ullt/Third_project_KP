package org.sta6.dev.third_project_kp.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.sta6.dev.third_project_kp.Entity.logindata;

@Repository
public interface loginDataRepository extends CrudRepository<logindata, Long> {
    boolean existsByUsername(String username);
}
