페북 페이지 탭 앱 부트스트랩
=====================

## 개발모드 세팅 방법
### 페이지에 탭 추가하는 URL
http://www.facebook.com/add.php?api_key=[:app_id]&pages=1

### etc/hosts 파일 수정
localhost를 validating 하는 페북 앱설정을 우회하기 위해
127.0.0.1 pagetab.com 과 같은 식으로 `etc/hosts`파일을 수정해준다.

### SSL self-signed certification 생성
https 지원을 위해 lib 폴더 안에 server.csr 파일을 생성해준다.

### initializers 세팅
`bypass_ssl_verification_for_open_uri.rb` 참고

### routes 설정
facebook page tab 에서 post로 접근하기 때문에 route 설정 필요.

### thin 설치
`thin start --ssl` 로 구동

### application_controller.rb 설정
`protect_from_forgery with: :exception` 을
`protect_from_forgery with: :null_session` 으로 바꿔준다.

### frame 관련 filter 세팅
response.headers["X-Frame-Options"] = "GOFORIT"

### fb channel 설정
gem 'fb-channel-file' 설치

