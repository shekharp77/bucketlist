/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function (){
    $(':input[type="submit"]').prop('disabled', false);
    $('#un').keyup(function (){
    
        var user=$('#un').val();
            if(user!=""){
                $.ajax({
                    url:'servlet',
                    type:'get',
                    data:{
                        type:"username",
                        username:user
                        },
                    success:function(data){
                        if(data=="Available"){
                            $('#u').html("Username Available");
                            $('#u').css({'color':'#05fc05'});
                            $(':input[type="submit"]').prop('disabled', false);
                        }
                        else if(data=="not"){
                            $('#u').html("Username NOT Available");
                            $('#u').css({'color':'red'});
                            $(':input[type="submit"]').prop('disabled', true);
                        }
                    },
                    error:function(){alert('error');}
                });
            }    
            $('#u').html("Please choose a Username");
            $('#u').css({'color':'red'});
    });
});
