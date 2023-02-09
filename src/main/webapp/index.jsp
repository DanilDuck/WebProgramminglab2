<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="img/img2.png">
    <style>
        <%@include file="css/style.css"%>
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=PT+Serif&display=swap" rel="stylesheet">
    <title> Я хочу спать </title>
</head>
<body>
<img class="anime-gif" src="img/anime4.gif" alt="граф">
<table id="main-page">
    <tr>
        <td id="head-box" colspan="2">
            <h4>Дагаев Даниил Сергеевич P32141   <a href="https://github.com/DanilDuck/Webprogramminglaba1"> <img class="git-img" src="img/git.png" alt="git-icon">  </a>  <a href="https://se.ifmo.ru/courses/web"> <img class="ifmo-img" src="img/sticker.png" alt="ifmo-icon">  </a> <span id="variant-text"> Вариант 14166</span></h4>
        </td>
    </tr>
    <tr class="content-box">
        <td id="graph-box">
            <div class="plot">
                <svg height="300" width="300">
                    <polygon class="graph_part" points="150,150 150,100 50,150"></polygon>
                    <path class="graph_part"  d="M150,100 A50,50 90 0,1 200,150 L 150,150 Z"></path>
                    <rect class="graph_part" x="150" y="150" height="100" width="50"></rect>


                    <line stroke="white" x1="0" x2="300" y1="150" y2="150"></line>
                    <line stroke="white" x1="150" x2="150" y1="0" y2="300"></line>
                    <polygon fill="white" points="150,0 144,15 155,15"></polygon>
                    <polygon fill="white" points="300,150 285,156 285,144"></polygon>

                    <line stroke="white" x1="200" x2="200" y1="155" y2="145"></line>
                    <line stroke="white" x1="250" x2="250" y1="155" y2="145"></line>

                    <line stroke="white" x1="50" x2="50" y1="155" y2="145"></line>
                    <line stroke="white" x1="100" x2="100" y1="155" y2="145"></line>

                    <line stroke="white" x1="145" x2="155" y1="75" y2="75"></line>


                    <line stroke="white" x1="145" x2="155" y1="225" y2="225"></line>


                    <text fill="white" x="190" y="140">½R</text>
                    <text fill="white" x="245" y="140">R</text>

                    <text fill="white" x="40" y="140">-R</text>
                    <text fill="white" x="85" y="140">-½R</text>

                    <text fill="white" x="160" y="80">½R</text>


                    <text fill="white" x="160" y="228">-½R</text>


                    <text fill="white" x="160" y="10">Y</text>
                    <text fill="white" x="290" y="140">X</text>

                    <circle fill="white" cx="150" cy="150" r="2"></circle>
                    <svg id="dots" height="300" width="300"></svg>
                </svg>
            </div>
        </td>
        <td id="value-box" >
            <div class="result-title">
                <h2 class="plate-top-title">Значения</h2>
            </div>
            <form id="input-form" class="validate_form">
                <div class="cords">
                    <div class="input"><b>Enter Y:</b><br>
                        <div>
                            <select id="value_Y" form="input-form">
                                <option value='-2'>-2</option>
                                <option value='-1.5'>-1.5</option>
                                <option  value='-1'>-1</option>
                                <option  value='-0.5'>-0.5</option>
                                <option value='0'>0</option>
                                <option value='0.5'>0.5</option>
                                <option value='1'>1</option>
                                <option value='1.5'>1.5</option>
                                <option value='2'>2</option>
                            </select>
                        </div>
                    </div>
                    <div class="input">
                        <div>
                            <b>Enter X:</b>
                        </div>
                        <div id="xDiv">
                            <input autocomplete="off" maxlength="5" id="xstring" type="text" name="x_coordinate" class="x field" size="19" placeholder="From -5 to 3."  >
                        </div>
                        <div class="buttons">
                            <input class="validate" type="submit" value="Submit">
                            <input class="resetData" type="reset" value="Reset">
                        </div>
                    </div>
                    <div class="input"><b>Enter R:</b><br>
                        <select id="value_R" form="input-form">
                            <option value='1'>1</option>
                            <option value='1.5'>1.5</option>
                            <option  value='2'>2</option>
                            <option  value='2.5'>2.5</option>
                            <option value='3'>3</option>
                        </select>
                    </div>
                </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="inform-box" id="table-box"  colspan="2" >
            <jsp:include page="table.jsp" />
        </td>
    </tr>
</table>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/backButton.js" ></script>
<script src="js/graph.js" ></script>
<script src="js/request.js"></script>
<script src="js/buttons.js"></script>
</body>
</html>