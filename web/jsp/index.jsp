<%--
  Created by IntelliJ IDEA.
  User: jackcheng
  Date: 2020/7/04
  Time: 下午 03:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="en">
<head>
  <title>Jack Biography</title>
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed&display=swap" rel="stylesheet">

</head>
<body>
<header>
  <span class="logo">THEREALJACKPOT</span>
  <a href="/Login?action=logout"><span class="option">Log Out</span></a>
  <a href="https://github.com/"><span class="option">My Project</span></a>
  <a href="#contact"><span class="option">Contact</span></a>
</header>

<main>
  <div class="biography">
    <h1 style="margin-top: 100px">Biography</h1>
    <br>
    <div class="biography-picture" style="display: inline-block">
      <img src="https://upload.cc/i1/2021/03/16/pSQWTu.jpg">
    </div>
    <div class="biography-content" style="display: inline-block">
      <h1 style="font-size: 16px;font-family: 'Noto Sans TC', sans-serif;text-align: left;letter-spacing: 2px;line-height: 24px">
        您好，我是鄭丞傑，是一個熱愛團隊合作的人，高中時的社團成發、大學時的活動總召，都使我了解到團體活動中最重要的就是溝通，各個職位互相協調，清楚傳達彼此的意見，這些看似不起眼的舉動都是活動成敗的關鍵，從中更是訓練我活動企劃的技巧以及領導能力。<br>
        大二曾經在服務業打工的我，學習到刻骨耐勞的精神，打工時正逢手搖飲料店的暑假旺季，每天都有上百單的銷量，從備料到飲料製作再到收銀，完完整整的訓練，更是提升了不少臨機應變的能力，同時更了解細節的重要<br>
        而我也樂於學習新知，大三暑假應徵到了數位行銷實習生，雖與本科系無關，但在創建部落格中，我把前端網頁的概念結合，運用HTML以及CSS寫網頁設計，而文章內容則是網路行銷，透過實習所運用的SEO增加網站的曝光度，實習期間也跟。同事合作愉快，每個禮拜開會以及討論，學到許多不一樣的想法。<br>
        大四透過實習，大幅提升程式的撰寫能力，不僅學習到以Java為背景的前端操作，還學習到更完整的站台架構MVC，並且透過站台維運以及開發，了解到業界的需求，同時更是訓練到極為重要的排錯以及又應對能力，這些都是學校學不到的，非常難得。
      </h1>
    </div>

  </div>
  <br>
  <div class="experience">
    <h1>Experience</h1>
    <br>
    <section id="timeline">

      <div class="tl-item">

        <div class="tl-bg" style="background-image: url(https://img.onl/3icJTN)"></div>

        <div class="tl-year">
          <p>社長</p>
        </div>

        <div class="tl-content">
          <h1>延平熱舞社 2014 SEP ~ 2015 JUN</h1>
          <p>舉辦迎新成發等活動以及協調整合各幹部意見</p>
        </div>

      </div>

      <div class="tl-item">

        <div class="tl-bg" style="background-image: url(https://img.onl/lp0BpS)"></div>

        <div class="tl-year">
          <p>店員</p>
        </div>

        <div class="tl-content">
          <h1>兔子兔子茶飲 2017 NOV ~ 2018 APR</h1>
          <p>茶飲製作、備料以及收銀</p>
        </div>

      </div>

      <div class="tl-item">

        <div class="tl-bg" style="background-image: url(https://img.onl/a6po6H)"></div>

        <div class="tl-year">
          <p>總召</p>
        </div>

        <div class="tl-content">
          <h1>系學春酒 2019 MAR 28</h1>
          <p>活動規劃、文書處理以及經費控管</p>
        </div>

      </div>

      <div class="tl-item">
        <div class="tl-bg" style="background-image: url(https://img.onl/OTSuSY)"></div>
        <div class="tl-year">
          <p>實習</p>
        </div>
        <div class="tl-content">
          <h1>意藍資訊 2020 JAN ~ 2020 OCT</h1>
          <p>站台功能開發以及維運、Selenium監測開發</p>
          <p></p>
        </div>

      </div>
    </section>

  </div>
  <br>
  <div class="skills">
    <h1>Skills</h1>
    <div class="skrow">
      <div class="skcol">
        <h2 style="font-family: 'Noto Sans TC', sans-serif;">語言能力</h2>
        <p style="font-family: 'Noto Sans TC', sans-serif;">多益 890 (金證)</p>
      </div>
      <div class="skcol"></div>
      <h2 style="font-family: 'Noto Sans TC', sans-serif;">電腦能力</h2>
      <p>Java</p>
      <p>HTML/CSS</p>
      <p>Javascript/JQuery/Ajax</p>
      <p>Selenium</p>
      <p>Illustrator</p>
    </div>
  </div>
  <br>
  <div class="game">
    <h1>Game</h1>
    <div>
      <jsp:include page="game.jsp"/>
    </div>
  </div>
  <div class="score" style="margin-top: 50px">
    <h1>Scoreboard</h1>
    <div id="board">
      <jsp:include page="scoreboard.jsp"/>
    </div>
    <div id="refresh_button" style="text-align: center;margin-top: 25px">
      <button class="btn btn-primary" type="refresh" onclick="refreshPage()">Refresh</button>
    </div>
  </div>
  <br>
  <br>
  <div class="illustrator" style="margin-top: 50px">
    <h1>Ai Portfolio</h1>
    <div class="mySlides">
      <img src="https://img.onl/KF8xAT">
    </div>

    <div class="mySlides">
      <img src="https://img.onl/45D7DW">
    </div>

    <div class="mySlides">
      <img src="https://img.onl/WTnQ98">
    </div>

    <div class="con">
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
      <div style="text-align:center;margin-top: 10px">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
      </div>
    </div>
  </div>

  <div class="movie" style="margin-top: 50px;text-align: center">
    <h1>API Project - 2020 Movie Search</h1>
    <div>
      <jsp:include page="movie.jsp"/>
    </div>
  </div>

  <div class="expectation">
    <h1>Expectation</h1>
    <div class="expectation-content">
      <h1 style="font-size: 18px;font-family: 'Noto Sans TC', sans-serif;text-align: left;letter-spacing: 2px;line-height: 24px">期望自己能更熟悉站台架構，實作出以Spring MVC為基礎之站台，同時能更熟悉了解JavaScript/Jquery/Ajax等前台操作，增加站台的多樣性!</h1>
    </div>
  </div>

</main>
<br>
<br>
<a name="contact"></a>
<footer>
  <div class="row" style="text-align: center;width: auto;margin-top: 20px">
      <div class="col-sm-2">
        <div class="title">Contact</div>
          <ul class="list-unstyled">
            <li>
              <div class='fas fa-phone' style="font-size:18px;color:#FFFFFF;margin-top: 10px;width: 300px">  0979129120</div>
            </li>
            <li>
              <div class="fa fa-envelope" style="font-size:18px;color:#FFFFFF;margin-top: 10px;width: 300px">  superjack870610dd@gmail.com</div>
            </li>
          </ul>
      </div>
      <div class="col-sm-2">
        <div class="title">Social</div>
        <div style="display: inline-block;margin-top: 10px">
          <a href="https://www.instagram.com/jackpot_610/?hl=zh-tw"><i class='fab fa-instagram' style="font-size:30px;color:#FFFFFF"></i></a>
        </div>
        <div style="display: inline-block ; margin-left: 10px;">
          <a href="https://www.facebook.com/profile.php?id=100003466923371"><i class="fab fa-facebook-square" style="font-size:30px;color:#FFFFFF;"></i></a>
        </div>
        <div style="display: inline-block ; margin-left: 10px;">
          <a href="https://www.linkedin.com/in/jack-cheng-22869418b/"><i class="fa fa-linkedin" style="font-size:30px;color:#FFFFFF;"></i></a>
        </div>
      </div>
      <div class="col-sm-2">
        <div class="title">Portfolio</div>
        <div style="display: inline-block ; margin-top: 10px;">
          <a href="https://github.com/jackpot66663?tab=repositories"><i class="fa fa-github" style="font-size:30px;color:#FFFFFF;"></i></a>
        </div>
      </div>
  </div>
</footer>


<script>
    var slideIndex = 1;
    showSlides(slideIndex);
    // Next/previous controls
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }
    // Thumbnail image controls
    function currentSlide(n) {
        showSlides(slideIndex = n);
    }
    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }

    function refreshPage() {
        $('#board').load("../jsp/scoreboard.jsp");
    }
</script>
</body>
</html>