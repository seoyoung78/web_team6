

var result = true;
var pwckCheck = false;
       
	function passwordCk(){
		const userPassword = $('#userPassword').val();
		const userPasswordCk = $('#userPasswordCk').val();    

        if(userPassword == userPasswordCk){
            pwckCheck = true;
            result = true;
            $("#nonSamePassword").css('display', 'none');
            $("#SamePassword").html("비밀번호가 일치합니다.");
            $("#SamePassword").css('display', 'block');
        }else{
            pwckCheck = false;
            result = false;
            $("#SamePassword").css('display', 'none');
            $("#nonSamePassword").html("비밀번호가 일치하지 않습니다.");
            $("#nonSamePassword").css('display', 'block');
            
        }
	}
	
	 function joinValidate() {
		event.preventDefault();

		//유효성 검사 코드
		const userName = $("#userName").val();
		const userSsn1 = $("#userSsn1").val();
		const userSsn2 = $("#userSsn2").val();
		const userId = $("#userId").val();
		const userPassword = $("#userPassword").val();
		const userPhone = $("#userPhone").val();
		const detailAddress = $("#sample4_detailAddress").val();
		const userAccount = $("#userAccount").val();
		const userBank = $("#userBank").val();
		const accountName = $("#accountName").val();

		if(userName == ""){
	         result = false;
	         $("#errorName").html("필수 사항입니다.");
	    } 
	      
		if(userSsn1 == "" || userSsn2 == ""){
	         result = false;
	         $("#errorSsn").html("필수 사항입니다.");
	    }else if(userSsn1.length != 6){
	    	 result = false;
	         $("#errorSsn").html("앞자리 6자리를 입력해주세요.");
	    }else if(userSsn2.length != 7){
	    	 result = false;
	         $("#errorSsn").html("뒷자리 7자리를 입력해주세요.");
	    }
		
		if(userId == ""){
	         result = false;
	         $("#errorId").html("필수 사항입니다.");
	     } else {
	         var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	         if (!re.test(userId)) {
	            result = false;
	            $("#errorId").html("올바른 이메일 형식으로 입력하세요.");
	         }
	     }
		
		if (userPassword == "") {
			result = false;
			$("#errorPassword").html("비밀번호를 입력하세요.");
		}
		
		if(userPhone == "") {
			result = false;
			$("#errorPhone").html("필수 사항입니다.");
		}else if(userPhone.length > 13){
	    	 result = false;
	         $("#errorPhone").html("정확한 번호를 입력해주세요.");
	    }
		
		if (detailAddress == "") {
			result = false;
			$("#errorDetailAddress").html("필수 사항입니다.");
		}
		
		if (userAccount == "") {
			result = false;
			$("#errorAccount").html("필수 사항입니다.");
		}
		
		if (userBank == "") {
			result = false;
			$("#errorBank").html("필수 사항입니다.");
		}
		
		if (accountName == "") {
			result = false;
			$("#errorAccountName").html("필수 사항입니다.");
		}
		
		

		if (result && pwckCheck) {
			$("#joinForm")[0].submit(); //form에서 id로 찾아서 사용
		}

	} 
	 
