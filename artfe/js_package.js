

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  order.jsp �� directOrder.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function check_val()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.form.r_name.value == "") 
	{
		alert("������ ������ �ݵ�� ������ �ؾ� �մϴ�. ");
		document.form.r_name.focus();
		return false;			
	}

	if (document.form.r_address.value == "") 
	{
		alert("������ �ּҴ� �ݵ�� ������ �ؾ� �մϴ�. ");
		document.form.r_address.focus();
		return false;			
	}

	if (document.form.r_phone.value == "") 
	{
		alert("������ ��ȭ��ȣ�� �ݵ�� ������ �ؾ� �մϴ�. ");
		document.form.r_phone.focus();
		return false;			
	}
 
   	document.form.submit();
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  order.jsp �� directOrder.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ��
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  insertMember.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function checkID()		// ID�� �Է¹��� �Ŀ� �˾�â�� ����ָ鼭 
{  										//   checkId.jsp (�ߺ��˻� ����)�� ȣ���� �ִ� �ڹٽ�ũ��Ʈ �Լ�
	var id = newMem.id.value;		//  form�� �̸��� newMem�� �Ϳ� �ָ��� ��!

    if (id  == "")				//   11~16��:  ID�� �Է¾��� ID �ߺ�üũ ��ư�� Ŭ���� ����� ó��
    {
		alert("ID�� �Է��� �ּ���!"); 
		newMem.id.focus(); 
		return; 
    }

	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}                                        // ���)  =>  window.open("URL", "â�̸�", "â�� Ư��");





function checkValue()             // ȸ������������ ���Է��� �׸��� ���� ���, ���޽����� �����ִ� �Լ�
{                                           
	if(newMem.id.value == "")     // if(document.newMem.id.value == "")��� ����ص� ������
    {
		alert("ID�� �Է��� �ּ���!");  //  ���ڿ��� ���Ե� ���â�� �����Ŵ
		newMem.id.focus();					//  �۾��� ��Ŀ��(Ŀ��)�� ID�� �Է��ϴ� �ؽ�Ʈ�ʵ�� �̵���Ŵ  
		return;                         //  �Լ��� ������ ������ ( "return false; " ��� ����ص� ������)
    }

    if(newMem.password.value == "") 
    {
		alert("��й�ȣ�� �Է��� �ּ���!");
		newMem.password.focus();
		return;
    }

    if(newMem.name.value == "") 
    {
		alert("������ �Է��� �ּ���!");
		newMem.name.focus();
		return;
    }

    if(newMem.joomin1.value == "") 
    {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է��� �ּ���!");
		newMem.joomin1.focus();
		return;
    }

    if(newMem.joomin2.value == "") 
    {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է��� �ּ���!");
		newMem.joomin2.focus();
		return;
    }

    if(newMem.birthYear.value == "") 
    {
		alert("�¾ ������ �Է��� �ּ���!");
		newMem.birthYear.focus();
		return;
    }

    if(newMem.birthMonth.value == "") 
    {
		alert("�¾ ���� �Է��� �ּ���!");
		newMem.birthMonth.focus();
		return;
    }

    if(newMem.birthDay.value == "") 
    {
		alert("�¾ ��¥�� �Է��� �ּ���!");
		newMem.birthDay.focus();
		return;
    }

    if(newMem.telephone.value == "") 
    {
		alert("��ȭ��ȣ�� �Է��� �ּ���!");
		newMem.telephone.focus();
		return;
    }

    if(newMem.address.value == "") 
    {
		alert("�ּҸ� �Է��� �ּ���!");
		newMem.address.focus();
		return;
    }

	if(newMem.hp1.value == "") 
    {
		alert("�޴��� ���ڸ� ������ �Է��� �ּ���!");
		newMem.hp1.focus();
		return;
    }

    if(newMem.hp2.value == "") 
    {
		alert("�޴��� �߰��ڸ� ��ȣ�� �Է��� �ּ���!");
		newMem.hp2.focus();
		return;
    }

    if(newMem.hp3.value == "") 
    {
		alert("�޴��� ���ڸ� ��ȣ�� �Է��� �ּ���!");
		newMem.hp3.focus();
		return;
    }

    newMem.submit();   // �Է��� ������ ��� ������ ������ (���۹�ư Ŭ���ϴ� �Ͱ� ���� ȿ��)
}





function idFocus()        // ���� �ε��Ǹ�  ID�� �Է��ϴ� ��ġ�� �ٷ� Ŀ���� ��ġ���ѳ���
{										// �ڹٽ�ũ��Ʈ �Լ�  (body �±׾��� onLoad �̺�Ʈ �ڵ鷯�� �ָ��� ��!)
	newMem.id.focus();
	return;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  insertMember.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ��
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  login.jsp �� manager.html ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function login_check()      // �α��ν� ���Է��׸� �κ��� üũ���ִ� �ڹٽ�ũ��Ʈ �Լ�
{
	if(document.login.id.value=="")
	{
    	alert("���̵� �Է��� �ּ���.");
    	document.login.id.focus();
    	return;	
    }

    if(document.login.pass.value=="")
	{
    	alert("��й�ȣ�� �Է��� �ּ���.");
    	document.login.pass.focus();			
    	return;
    }
		
    document.login.submit();
}



function onEnterSubmit()     // �α��ι�ư�� Ŭ������ �ʰ�, ����Ű�� �Է��ϴ��� �α��� �����ϰ� ����               
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  login.submit();    //  "keyCode==13"�� ����Ű�� �Էµ��� �ǹ���
}
	

function login_focus()     // ���� �ε��Ǹ�  ID�� �Է��ϴ� ��ġ�� �ٷ� Ŀ���� ��ġ���ѳ���
{											// �ڹٽ�ũ��Ʈ �Լ�  (body �±׾��� onLoad �̺�Ʈ �ڵ鷯�� �ָ��� ��!)
   	document.login.id.focus();
   	return;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  login.jsp �� manager.html ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ��
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  viewDetailProduct.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function directOrd()        //  "��ñ����ϱ�" ��ư�� Ŭ���� ȣ��
{
	var str=product.qty.value;
	var frm = document.product;
	frm.action = "directOrder.jsp";
	frm.submit();
}




function inLike()              //  "��ٱ��ϴ��" ��ư�� Ŭ���� ȣ��
{
	alert('������翡 �߰��Ǿ����ϴ�.');
			obj.src="images/fullheart.png";
			var str=like.b_qty.value;
			var frm = document.like;
			frm.action = "inLike.jsp";
			frm.submit();
}

function inCart()              //  "��ٱ��ϴ��" ��ư�� Ŭ���� ȣ��
{
	var str=product.qty.value;
	var frm = document.product;
	frm.action = "inCart.jsp";
	frm.submit();
}





function enlarge()           //  ��ǰ�̹��� Ŭ���� �˾�â�� ����ָ鼭 �̹��� ǥ��
{
	var no = document.product.prdNo.value;
	window.open("./images/"+no+".jpg","win", "width=280, height=280, scrollbars=no, resizable=no");
}



function amountCheck()     //   �ֹ������� ��ȿ�� ���� ������ ó���� ��
{
	obj=document.product.qty;
	if(isNaN(obj.value))          //    isNaN(a)�Լ��� a�� ���ڰ� �ƴ� ���, true�� return����
	{
		obj.value="1";
		alert('���ڸ� �Է����ּ���');
		return;
	}

   if(obj.value < 1)
	{
		obj.value="1";
	}
}


function amountPlus()         //   �ֹ������� 1 ���� ��Ŵ
{
	obj=document.cart.b_qty;
	obj.value=parseInt(obj.value) + 1;
}


function amountMinus()        //   �ֹ������� 1 ���� ��Ŵ
{
	obj=document.cart.b_qty;
	if(parseInt(obj.value)  > 1)
	{
		obj.value=parseInt(obj.value) - 1;
	}
	else
	{
		alert('���̻� ���ϼ��� �����ϴ�');
		return;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  viewDetailProduct.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ��
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var i = 0;
function toggle_object(post_id)
{  

    i = i + post_id;
    var obj = document.getElementById('test');  
    if(!obj) return;  
 
    if(i%2!=0)
    {  
			alert('������翡 �߰��Ǿ����ϴ�.');
			obj.src="images/fullheart.png";
			var str=like.e_no.value;
			var frm = document.like;
			frm.action = "inLike.jsp";
			frm.submit();
       
    }
    else
    {  
		  alert('������翡�� �����Ǿ����ϴ�.');
			obj.src="images/heart.png";
			var str=like.e_no.value;
			var frm = document.like;
			frm.action = "deletelike.jsp";
			frm.submit();
    }


function delcart(){

			alert('���ٱ��Ͽ��� �����Ǿ����ϴ�.');
			document.location.href="mpCart.jsp";
	}
}
var i = 0;
function cartSum(frm)
{
   var sum = 0;
   var count = frm.chk.length;
   for(var i=0; i < count; i++ ){
       if( frm.chk[i].checked == true ){
       sum += parseInt(frm.chk[i].value);
       }
   }
   frm.total_sum.value = sum;
   return sum;
}
      
       var mpmenu = document.getElementsByClassName("mpmenu");

      function handleClick(event) {
        console.log(event.target);
        // console.log(this);
        // �ܼ�â�� ���� �Ѵ� ������ ���� ���´�

        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
          event.target.classList.remove("clicked");
        } else {
          for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
          }

          event.target.classList.add("clicked");
        }
      }

      function init() {
        for (var i = 0; i < mpmenu.length; i++) {
          mpmenu[i].addEventListener("click", handleClick);
        }
      }

      init();