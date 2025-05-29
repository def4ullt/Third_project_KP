package org.sta6.dev.third_project_kp.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.sta6.dev.third_project_kp.Entity.Workload;
import org.sta6.dev.third_project_kp.Entity.WorkloadId;

@Repository
public interface WorkloadRepository extends CrudRepository<Workload, WorkloadId> {
}
