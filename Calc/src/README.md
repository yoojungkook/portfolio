# vscode - JavaFX 설정
### 환경설정
- JDK: openjdk 17
- OS: window10 Pro(22H2)
- IDE: vscode
- JavaFX: openjfx-17.0.8
- vscode Extensions: Project Manager for JavaFX
    - 기타 부수적인 자바 관련된 익스텐션은 있다는 가정하에 진행
  
<br/>

## .vscode/launch.json
- launch.json 파일이 없을 경우
    - 디버그 모양을 클릭한 후 run 버튼 밑에 launch.json 버튼 클릭시 활성화  
    - launch.json 파일이 있을 경우
        ```xml
        {
            // Use IntelliSense to learn about possible attributes.
            // Hover to view descriptions of existing attributes.
            // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
            "version": "0.2.0",
            "configurations": [
                {
                    "type": "java",
                    "name": "App",
                    "request": "launch",
                    "mainClass": "App",
                    "vmArgs": "--module-path [...] --add-modules=javafx.controls,javafx.fxml"
                }
            ]
        }
        ```
        - [ ... ] : 이곳에 javafx의 lib파일이 있는 path 경로를 입력
            - 예) C:\\javafx\\lib
---  
- ### JAVA PROJECTS 설정
    - vscode의 explorer에서 밑단에 있는 **JAVA PROJECT** 클릭
    - JavaFX 프로젝트 이름 우클릭
    - **configure classpath** 클릭
    - **[Referenced Libraries]** 에 있는 **add** 버튼 클릭  
    - 다운받은 javafx 버전의 lib 폴더에 있는 모든 .jar 파일 선택
