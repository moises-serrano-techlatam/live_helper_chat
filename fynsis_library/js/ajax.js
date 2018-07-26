var inputdata = { last_name : 'test int'}
var saveData = $.ajax({
     type: 'POST',
     url: "crm.php?action=add_contact",
     data: inputdata,
     dataType: "json",
      success: function(resultData) { alert("Save Complete") }
});
saveData.error(function() { alert("Something went wrong"); });