<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
<body>

<?php
include 'open.php';
$school = $_GET['school'];
$year = $_GET['year'];
$instructor = $_GET['instructor'];
$instructor = $mysqli->real_escape_string($instructor);
$instructor = "%" . $instructor . "%";
$course = $_GET['course'];
$course = $mysqli->real_escape_string($course);
$course = "%" . $course . "%";

if ($school !== "--" && $year !== "--" && $instructor !== "%%" && $course !== "%%") {
  // everything
  $mysqli->multi_query("CALL SYFC('".$school."','".$year."','".$instructor."','".$course."');");
} elseif ($school !== "--" && $year !== "--" && $instructor !== "%%") {
  // school year instructor
  $mysqli->multi_query("CALL SYF('".$school."','".$year."','".$instructor."');");
} elseif ($school !== "--" && $instructor !== "%%" && $course !== "%%") {
  // school instructor course
  $mysqli->multi_query("CALL SFC('".$school."','".$instructor."','".$course."');");
} elseif ($school !== "--" && $year !== "--" && $course !== "%%") {
  // school year course
  $mysqli->multi_query("CALL SYC('".$school."','".$year."','".$course."');");
} elseif ($year !== "--" && $instructor !== "%%" && $course !== "%%") {
  //year instructor course
  $mysqli->multi_query("CALL YFC('".$year."','".$instructor."','".$course."');");
} elseif ($school !== "--" && $year !== "--") {
  // school year
  $mysqli->multi_query("CALL SY('".$school."','".$year."');");
} elseif ($school !== "--" && $instructor !== "%%") {
  // school instructor
  $mysqli->multi_query("CALL SF('".$school."','".$instructor."');");
} elseif ($school !== "--" && $course !== "%%") {
  // school course
  $mysqli->multi_query("CALL SC('".$school."','".$course."');");
} elseif ($year !== "--" && $instructor !== "%%") {
  // year instructor
  $mysqli->multi_query("CALL YF('".$year."','".$instructor."');");
} elseif ($year !== "--" && $course !== "%%") {
  // year course
  $mysqli->multi_query("CALL YC('".$year."','".$course."');");
} elseif ($instructor !== "%%" && $course !== "%%") {
  // instructor course
  $mysqli->multi_query("CALL FC('".$instructor."','".$course."');");
} elseif ($school !== "--") {
  // school
  $mysqli->multi_query("CALL ShowInfoBySchool('".$school."');");
} elseif ($year !== "--") {
  // year
  $mysqli->multi_query("CALL ShowInfoByYear('".$year."');");
} elseif ($instructor !== "%%") {
  // instructor
  $mysqli->multi_query("CALL ShowInfoByINstructor('".$instructor."');");
} elseif ($course !== "%%") {
  // course
  $mysqli->multi_query("CALL ShowInfoByCourse('".$course."');");
} else {
  $mysqli->multi_query("CALL master();");
}

/*
if ($school != "--") {
  if ($year != "--") {
    $mysqli->multi_query("CALL SY('".$school."','".$year."');");
  } else {
    $mysqli->multi_query("CALL ShowInfoBySchool('".$school."');");
  }
} elseif($year != "--") {
    $mysqli->multi_query("CALL ShowInfoByYear('".$year."');");
} else {
  $mysqli->multi_query("CALL master();");
}
*/

$res = $mysqli->store_result();

echo "<table id = \"example\" class=\"table-condensed table-hover\">";                          // The procedure executed successfully.
echo "<thead>";
echo "<tr>
      <th> Course ID </th>
      <th> Title </th>
      <th> Year </th>
      <th> Semester </th>
      <th> Instructor Name </th>
      <th> Quality </th>
      <th> Teaching Effectiveness </th>
      <th> Intellectual Challenge </th>
      <th> Workload </th>
      <th> Feedback </th></tr>";
echo "</thead>";
echo "<tbody>";
while ($row = $res->fetch_assoc()) {
    echo "<tr>
    <td>" . $row['CID'] . "</td>
    <td>" . $row['Title'] . "</td>
    <td>" . $row['YEAR'] . "</td>
    <td>" . $row['Semester'] . "</td>
    <td>" . $row['InstructorName'] . "</td>
    <td>" . $row['QualityMean'] . "</td>
    <td>" . $row['TeachingEffectivessMean'] . "</td>
    <td>" . $row['IntlChallenegeMean'] . "</td>
    <td>" . $row['WorkloadMean'] . "</td>
    <td>" . $row['FeedbackMean'] . "</td></tr>";                // Print every row of the result.
}
echo "</tbody>";
echo "</table>";
mysqli_close($con);
?>
</body>
</html>
