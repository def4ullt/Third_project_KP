@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Workload
@param List<Workload> workloads


  <!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Таблиця навантажень</title>
  <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>
  <a class="logo" href="/">Головне меню</a>
  <nav id="nav-menu">
    <a href="/teacher">Викладачі</a>
    <a href="/subject">Предмети</a>
    <a>Ввійти</a>
  </nav>
</header>

<table>
  <tr>
    <th>ID Вчителя</th>
    <th>ID предмету</th>
    <th>Номер групи</th>
    <th>Рік</th>
    <th>Практичні години</th>
    <th>Лекційні години</th>
    <th>дії</th>
  </tr>

  <tbody>
  @for(Workload workload : workloads)
  <tr>
    <td>${workload.getTeacher_Id()}</td>
    <td>${workload.getSubject_Id()}</td>
    <td>${workload.getGroup_Id()}</td>
    <td>${workload.getYear()}</td>
    <td>${workload.getLecture_Hours()}</td>
    <td>${workload.getPractical_Hours()}</td>
    <td></td>
  </tr>
  @endfor
  </tbody>
</table>

</body>
</html>
