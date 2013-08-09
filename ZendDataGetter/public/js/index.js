$(document).ready(function(){

    $('#filterform').dialog(
        {
            autoOpen: false,
            height: 300,
            width: 350,
            modal: true,
            draggable: true,
            closeOnEscape: true,
            position: 'top'
        }
    );

    $('#filterbutton').click(function(){
        $('#filterform').dialog("open");
        $('#beginningdate').datepicker(
            {
                autoOpen:true,
                dateFormat:'yy-mm-dd'
            }
        ).mousedown(function(){
                $(this).datepicker("hide");
                $(this).blur();
            });

        $('#enddate').datepicker(
            {
                dateFormat:'yy-mm-dd'
            }
        );
        $("input").blur();
    });

});