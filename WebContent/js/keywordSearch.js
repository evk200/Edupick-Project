  
function recordSearch(){
 //카테고리를 선택했음에도 불구하고, 키워드를 넣지 않은 경우 유효성 체크하자!!
 if(form1.category.value!="all"){
  if(form1.keyword.length==0){
   alert("검색어를 넣어주세요");
   form1.keyword.focus();
   return;
  }
 }
 form1.action="list.jsp";
 form1.submit();

}
