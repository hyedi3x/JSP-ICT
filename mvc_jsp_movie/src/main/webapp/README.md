
# 🎥 CGV 페이지 개발
`servlet`과 `jsp`를 이용한 MVC 구조의 영화관(CGV) 홈페이지 개발 
<br /><br />

## ⚙️ Settings (백엔드) 
###  `Java Resources > src/main/java >`
| mvc.jsp.controller | mvc.jsp.dao | mvc.jsp.dto | mvc.jsp.service | 
|:---:|:---:|:---:|:---:|
| CustomerController.java(servlet) | CustomerDAO.java(interface)<br/> CustomerDAOImpl.java | CustomerDTO.java| CustomerService.java(interface)<br/> CustomerServiceImpl.java
<br/>

## ⚙️ Settings (프론트엔드) 
###  `webapp > `
| common | customer |resources|
|:---:|:---:|:---:|
|`common(공통)`<br/> header.jsp<br/> footer.jsp<br/> cgvAd.jsp<br/> main.jsp| `join(회원가입)`<br/> join.jsp<br/> joinAction.jsp<br/> idConfirm.jsp<br/> | `css > common` <br/> header.css<br/> footer.css<br/> cgvAd.css<br/> common.css<br/> main.css<br/><br/> `css > customer>join`<br/> join.css <br/><br/> `imgs > common > ad`<br/> cgv-ad1.png <br/><br/>  |

## ⚙️ Settings (자바스크립트) 
###  `webapp > resources > js`
| common | customer ||
|:---:|:---:|:---:|
||`js > customer > join`<br/> join.js(회원가입)<br/> daumAdressAPI.js (우편주소 API)|


