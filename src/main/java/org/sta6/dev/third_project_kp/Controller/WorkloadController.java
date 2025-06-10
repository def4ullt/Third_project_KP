package org.sta6.dev.third_project_kp.Controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.sta6.dev.third_project_kp.Entity.Workload;
import org.sta6.dev.third_project_kp.Entity.WorkloadId;
import org.sta6.dev.third_project_kp.Repository.WorkloadRepository;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/workload")
@RequiredArgsConstructor
public class WorkloadController {

    private final WorkloadRepository workloadRepository;

        @PostMapping
    public Workload create(@RequestBody Workload workload) {
        return workloadRepository.save(workload);
    }

    @PutMapping("/{teacherId}/{subjectId}/{groupId}/{year}")
    public ResponseEntity<Workload> update(
            @PathVariable Long teacherId,
            @PathVariable Long subjectId,
            @PathVariable String groupId,
            @PathVariable Integer year,
            @RequestBody Workload updatedWorkload
    ) {
        WorkloadId id = new WorkloadId(teacherId, subjectId, groupId, year);
        return workloadRepository.findById(id)
                .map(existing -> {
                    existing.setLecture_Hours(updatedWorkload.getLecture_Hours());
                    existing.setPractical_Hours(updatedWorkload.getPractical_Hours());
                    existing.setOwner(updatedWorkload.getOwner());
                    return ResponseEntity.ok(workloadRepository.save(existing));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{teacherId}/{subjectId}/{groupId}/{year}")
    public void delete(
            @PathVariable Long teacherId,
            @PathVariable Long subjectId,
            @PathVariable String groupId,
            @PathVariable Integer year
    ) {
        WorkloadId id = new WorkloadId(teacherId, subjectId, groupId, year);
        workloadRepository.deleteById(id);
    }
}
