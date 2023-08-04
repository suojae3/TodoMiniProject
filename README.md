
![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=250&section=header&text=TODO%20App%20mini%20project&fontSize=40&animation=fadeIn&fontAlign=28)

---

### Contents

[1. App 시연](#1-app-시연)<br/>
[2. 제작 기간](#2-제작-기간)<br/>
[3. 구현 사항](#3-구현-사항)<br/>
[4. 공부내용 정리](#4-공부내용-정리)<br/>
[5. 어려웠던 점](#5-어려웠던-점)<br/>
[6. 향후 방향](#6-향후-방향)<br/>

--- 

### 1. App 시연 

<br/>

&nbsp;&nbsp;&nbsp;&nbsp;<img src="Simulator Screen Recording - iPhone 14 Pro - 2023-08-04 at 14.55.55.gif" height="350"><br/>

#

### 2. 제작 기간 

- #### 2023.08.02 ~ 08.04 <br/>

#

### 3. 구현 사항

- **[Tech Stack]** <br/> `Swift`, `UIKit` <br/>
- **[Architecture]** <br/>MVVM 디자인 패턴 <br/>
- **[Database]** <br/>`UserDeafaults`, `Codable` <br/>
- **[Components]** <br/>`Navigation Controller`, `Table View` <br/>
- **[Feature]** <br/>스토리보드 사용 없이 코드로 구현

#

### 4. 공부내용 정리
- <a href="https://github.com/suojae3/AutoresizingMask.git" target="_blank"><strong> 스토리보드 없이 버튼을 코드로 구현해보자(feat. Autoresizing Mask)
- <a href="https://github.com/suojae3/Codable-Protocol.git" target="_blank"><strong> Codable 프로토콜이란?
- <a href="https://github.com/suojae3/UserDefaults.git" target="_blank"><strong> UserDefaults는 어떤 데이터베이스인가요?
- <a href="https://github.com/suojae3/ToDoMVVM.git" target="_blank"><strong> MVVM 패턴은 어떻게 적용시켰나요?


<br/>

#

### 5. 어려웠던 점

- 이번 미니 프로젝트에서 가장 재밌었지만 어려웠던 점은 캡슐화 과정이었다.
- 최대한 빈구멍을 private로 막고싶었으나 그러기 위해서는 속성객체를 private로 만든뒤 function을 따로 만들거나 계산속성으로 구현해야했다
- 하지만 시간상의 문제로 private(set)으로 처리했고 나머지 전역변수들을 최소화시키지 못한 것 같아 아쉬움이 남았다

<br/>

#

### 6. 향후 방향

- 아키텍쳐가 가장 중요하다. 건강한 신체에 건강한 마음이 깃들듯이 건강한 아키텍쳐에 건강한 코드가 깃든다. 디자인 패턴에 대해 학습 중점을 두고 싶다.
- 컴퓨터공학 전공지식은 산소처럼 중요하다. 만약 이전에 운영체제를 공부하지 않고 UserDefatults가 cache 메모리라는 정보를 접했으면 이해하지 못했을 것이다. 컴퓨터 전공지식에 대한 학습을 이어나가야겠다

