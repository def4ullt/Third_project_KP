package org.sta6.dev.third_project_kp.Repository;

import org.springframework.data.repository.CrudRepository;
import org.sta6.dev.third_project_kp.Entity.Workload;
import org.sta6.dev.third_project_kp.Entity.WorkloadId;

public interface WorkloadRepository extends CrudRepository<Workload, WorkloadId> {
}
