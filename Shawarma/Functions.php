<?php

function make_table($query) {
  $table = '<table class="tbl" cellpadding="10" border="1px"><tr>';
  foreach($query[0] as $key => $val) {
    if(!is_numeric($key)) {
          $table .= "<th>$key</th>";
    }
  }
  $table .= '</tr>';
  
  foreach ($query as $row) {
    $table .= '<tr>';
    foreach ($row as $k => $v) {
      if(!is_numeric($k)) {
        $table .= "<td>$v</td>";
      }
    }
    $table .= '</tr>';
  }
  $table .= '</table>';
  return $table;
}

function make_select($select_name, $query_res = false,  $isRequired = true, $disabled_string = '') {
  $required = $isRequired ? 'required' : '';
  $select = "<select name=\"$select_name\" $required>";
  
  if ($disabled_string) {
    $select += "<option value=\"\" disabled selected>$disabled_string</option>";
  }
  
  if($query_res) {
    foreach($query_res as $query_row) {
      $select .= "<option value=\"$query_row[0]\"> $query_row[1] </option>";
    }
  }
  $select .= '</select>';
  return $select;
}

?>
