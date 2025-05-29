@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Teacher
@param List<Teacher> teachers

<table>
    <tr>
        <th>Прізвище</th>
        <th>Ім'я</th>
        <th>По батькові</th>
        <th>Науковий ступінь</th>
        <th>Посада</th>
        <th>Стаж</th>
    </tr>

    @for(Teacher teacher : teachers)
    <tr>
        <td>${teacher.getLast_Name()}</td>
        <td>${teacher.getFirst_Name()}</td>
        <td>${teacher.getSecond_name()}</td>
        <td>${teacher.getAcademic_degree()}</td>
        <td>${teacher.getPosition()}</td>
        <td>${teacher.getExperience()}</td>
    </tr>
    @endfor
</table>
