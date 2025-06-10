@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Workload
@param List<Workload> workloads
@param String username
@param Boolean isAdmin

  <!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Таблиця навантажень</title>
  <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>
  <div class="logo">Головне меню</div>
  <nav id="nav-menu">
    @if(username != null)
      <span>Ви увійшли як <strong>${username}</strong></span>
    @endif
    @if(isAdmin)
      <a href="/adminPanel">Панель даних для входу</a>
    @endif
    @if(username != null)
      <a href="/teacher">Викладачі</a>
      <a href="/subject">Предмети</a>
      <a href="/logout">Вийти</a>
    @endif
  </nav>
</header>

<div style="width: 90%; margin: 20px auto; display: flex; justify-content: flex-end;">
  <button href="/create" class="create-btn">Створити</button>
</div>
<table>
  <tr>
    <th>Викладач</th>
    <th>Предмет</th>
    <th>Номер групи</th>
    <th>Рік</th>
    <th>Практичні години</th>
    <th>Лекційні години</th>
    <th>Ким створено:</th>
    <th>дії</th>
  </tr>

  <tbody>
  @for(Workload workload : workloads)
  <tr>
    <td>${workload.getTeacher().getSecond_name()} ${workload.getTeacher().getFirst_Name()} ${workload.getTeacher().getLast_Name()}</td>
    <td>${workload.getSubject().getName()}</td>
    <td>${workload.getGroup_Id()}</td>
    <td>${workload.getYear()}</td>
    <td>${workload.getLecture_Hours()}</td>
    <td>${workload.getPractical_Hours()}</td>
    <td>
      @if(workload.getOwner() != null)
        ${workload.getOwner_info().getUsername()}
      @else
        Невідомо
      @endif
    </td>
    <td>
      @if(workload.getOwner() != null && username.equals(workload.getOwner_info().getUsername()) || isAdmin)
        <button class="btn-edit" onclick="location.href='/workload/edit/${workload.getTeacher_Id()}'">Редагувати</button>
          <button class="btn-del"
                  onclick="deleteItem('${workload.getTeacher_Id()}', '${workload.getSubject_Id()}', '${workload.getGroup_Id()}', '${workload.getYear()}')">
              Видалити
          </button>
      @endif
    </td>
  </tr>
  @endfor
  </tbody>
</table>

<script>
    function deleteItem(teacherId, subjectId, groupId, year) {
        if (confirm('Ви впевнені, що хочете видалити запис?')) {
            fetch(`/api/workload/` + teacherId + `/` + subjectId + `/` + groupId + `/` + year, {
                method: 'DELETE'
            }).then(() => location.reload());
        }
    }
</script>

</body>
</html>
