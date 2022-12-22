<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
	<title>Parcel Sandbox</title>
	<meta charset="UTF-8" />
	<style>
.rouletter{
	position: relative;
    width:400px;
    height:400px;
}
.rouletter-bg{
	position: absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    width:350px;
    height:350px;
    border-radius:350px;
	overflow:hidden;
}
.rouletter-wacu{
    width:100%;height:100%;
	background:#f5f5f2 url('https://m.lifeplanet.co.kr:444/commons/slink/administrator/openInnovation/img/MO)%20360%ED%94%8C%EB%9E%98%EB%8B%9B_%EB%A3%B0%EB%A0%9B%ED%8C%90_476x476_201026.png') no-repeat;
    background-size:100%;
    transform-origin: center;
}
.rouletter-arrow{
	position: absolute;
    top:0;
    left:50%;
    transform:translateX(-50%);
    width:1px;
    height:1px;
    border-right:10px solid transparent;
    border-left:10px solid transparent;
    border-top:40px solid red;
    border-bottom:0px solid transparent;
}
.rouletter-btn{
	position: absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    width:80px;
    height:80px;
    border-radius:80px;
    background:#fff;
    border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
    border: 2px solid;
}

// 돌림판 회전 애니메이션
.on{
    animation-name: ani;
    animation-duration: 0.1s;
    animation-fill-mode: forwards;  
    animation-iteration-count: infinite;
}

@keyframes ani{
    0% { 
        transform: rotate(0deg); 
    	transition-timing-function: ease-out;
    }
    100%{ 
        transform: rotate(360deg); 
    }
}
	</style>
</head>

<body>
	<div class="rouletter">
		<div class="rouletter-bg"><div class="rouletter-wacu"></div></div>
		<div class="rouletter-arrow"></div>
		<button class="rouletter-btn">start</button>
	</div>
</body>
<Script>
var rolLength = 6; 
var setNum; //랜덤 숫자 담을 변수
var hiddenInput = document.createElement("input"); //히든인풋을 사용
hiddenInput.className = "hidden-input";

// 랜덤 숫자 부여
const rRandom = () => {
  var min = Math.ceil(0);
  var max = Math.floor(rolLength - 1);
  return Math.floor(Math.random() * (max - min)) + min;
};

// 돌림판 인터렉션
const rRotate = () => {
  var panel = document.querySelector(".rouletter-wacu");
  var btn = document.querySelector(".rouletter-btn");
  var deg = [];
  for (var i = 1, len = rolLength; i <= len; i++) {
    deg.push((360 / len) * i);
  }

  var num = 0;
  document.body.append(hiddenInput);
  setNum = hiddenInput.value = rRandom();

  var ani = setInterval(() => {
    num++;
    panel.style.transform = "rotate(" + 360 * num + "deg)";
    btn.disabled = true; //button,input
    btn.style.pointerEvents = "none"; //a 태그

    if (num === 50) {
      clearInterval(ani);
      panel.style.transform = "rotate(" + deg[setNum] + "deg)";
    }
  }, 50);
};

// 결과 팝업
const rLayerPopup = (num) => {
  switch (num) {
    case 1:
      alert("당첨!! 스타벅스 아메리카노");
      break;
    case 3:
      alert("당첨!! 햄버거 세트 교환권");
      break;
    case 5:
      alert("당첨!! CU 3,000원 상품권");
      break;
    default:
      alert("꽝! 다음기회에");
  }
};

// 돌림판 리셋
const rReset = (ele) => {
  setTimeout(() => {
    ele.disabled = false;
    ele.style.pointerEvents = "auto";
    rLayerPopup(setNum);
    hiddenInput.remove();
  }, 5500);
};

document.addEventListener("click", function (e) {
  var target = e.target;
  if (target.tagName === "BUTTON") {
    rRotate();
    rReset(target);
  }
});
</script>
</html>