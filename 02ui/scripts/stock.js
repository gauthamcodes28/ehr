$(document).ready(function(){
	var devmode=true;
	//Make Update Scripts Start
					$('#status').hide();
				$('#reenter').hide();
				//$('#stock').toggle();
               
				
				//$("#pro").hide();
				
				$('.add-row').on('click',function(){
					if(devmode)
						console.log("start add-row function");
					var name=$('#sel1').val();
					 
					 $.ajax({
							   url:"../08common/dataprocess.php",
							   data:{'name':name,"order_type":"stock_row"},
							   method:'POST',
							   success: function(data){
								   if(devmode)
										console.log("start ajax success function");
									$("#stock tbody").append(data);
									if(devmode)
										console.log("end ajax success function");
								 }
					});
					
					if(devmode)
						console.log("end add-row function");
				});
				
				// Find and remove selected table rows
        $(".delete-row").on('click',function(){
            $("table tbody").find('input[name="type_checked"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
				
				$('.checkall').on('click', function () {
        var $this = $(this),
            // Test to see if it is checked
            checked = $this.prop('checked'),
            //Find all the checkboxes
            cbs = $this.closest('table').children('tbody').find('.checkbox');
        // Check or Uncheck them.
        cbs.prop('checked', checked);
        //toggle the selected class to all the trs
        cbs.closest('tr').toggleClass('selected', checked);
    });

				//Stock Update Data Save
$('#savestock').on('click', function(){
					//Medicines Data Entry
						
						//All arrays to store the data of each row in sequence
						var typename=[];
						var name=[];
						var amountarr=[];
						var usernamearr=[];
						var net=[];
						
						var next;
						var i=0;
						var flag=true;
						//console.log($('.given_value'));
						
			
			//console.log("entered");
			$('#update_table tbody').find('.type_td').children('label').each(function(){
						var type_name=$(this);
						//console.log(type_name.text());//Ark
						var select_name=type_name.closest('td').siblings('.select_td').children('.select_name');//Alovera
						//console.log(select_name.val());
						var amount=select_name.closest('td').siblings('.amount_td').children('.amount');//Amount Value
						//console.log(amount.val());
							
						//console.log(username.val());
						net[i]=parseInt(amount.parent().siblings(".net_td").children().val());
						typename[i]=type_name.text();
						name[i]=select_name.val();
						amountarr[i]=parseInt(amount.val());
						i++;
						});
						
						console.log(typename+'--'+name+'--'+amountarr);
					if(typename.length==0){
						flag=false;
						alert('Select Atleast One Medicine');
					}
					else{
						for(var i=0;i<name.length;i++)
						{	//console.log(i+name[i]);
							if(name[i]==null)
							{
								flag=false;
								alert('Add Atleast One Medicine');
								break;
								//console.log(name[i]);
							}
						}
						for(var i=0;i<amountarr.length;i++)
						{	//console.log(i+amountarr[i]);
							if(amountarr[i]=='')
							{
								flag=false;
								alert('Add Amount');
								break;
								//console.log(name[i]);
							}
						}
						//alert('Select Atleast One Medicine');
					}
					
					
					if(flag)
					{
						
						var t=typename.join();
						var n=name.join();
						var a=amountarr.join();
						var netval=net.join();
						var u=$.trim($('#entry_user').text());
						if(devmode)
						console.log("inside flag success:"+t+n+a+u);
						$.ajax({
										url: "../08common/dataprocess.php",
										dataType: 'text',
										data: {typeval:t,nameval:n,usernameval:u,amountval:a,username:u,netcontent:netval,'order_type':'stock_insert'},                         // Setting the data attribute of ajax with file_data
										type: 'post',
										success:function(dataset){
											//console.log(dataset);
											$('#status').html("Data Updated Successfully..");
											$('.editable').prop('disabled',true);
											$('#savestock').hide();
											$('#reenter').show();
											$('#delete').hide();
											$('.add-row').hide();
											$('#sel1').hide();
											$('#status').show();
										}
							   });
						   
					}
						  // console.log("entered");
						  
					
				});//ENd od #SaveStock
	
				$('#reenter').on('click',function(){
					location.reload();
				});
				
	//Make Update Scripts ENd
	
	
	
	
});