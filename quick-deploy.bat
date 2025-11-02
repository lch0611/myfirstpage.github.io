@echo off
chcp 65001 >nul
echo ========================================
echo GitHub Pages 자동 배포
echo ========================================
echo.

REM 저장소 URL 설정
set REPO_URL=https://github.com/lch0611/myfirstpage.git
set REPO_NAME=myfirstpage
set USERNAME=lch0611

echo [1/4] 저장소 생성 안내
echo.
echo 먼저 GitHub에서 저장소를 생성해주세요:
echo https://github.com/new
echo.
echo 저장소 정보:
echo   - 이름: %REPO_NAME%
echo   - 공개: Public
echo   - README 추가: 체크 해제
echo.
echo 저장소를 생성하셨다면 아무 키나 누르세요...
pause >nul

echo.
echo [2/4] Git 원격 저장소 설정 중...
git remote remove origin 2>nul
git remote add origin %REPO_URL%
if %ERRORLEVEL% NEQ 0 (
    echo 오류: 원격 저장소 추가 실패
    pause
    exit /b 1
)
echo ✓ 원격 저장소 추가 완료

echo.
echo [3/4] 브랜치를 main으로 변경 중...
git branch -M main
echo ✓ 브랜치 변경 완료

echo.
echo [4/4] GitHub에 푸시 중...
git push -u origin main
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ⚠ 푸시 실패
    echo 저장소가 생성되었는지 확인해주세요:
    echo https://github.com/%USERNAME%/%REPO_NAME%
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✓ 배포 완료!
echo ========================================
echo.
echo 다음 단계: GitHub Pages 활성화
echo 1. https://github.com/%USERNAME%/%REPO_NAME%/settings/pages 접속
echo 2. Source: main 브랜치, / (root) 폴더 선택
echo 3. Save 클릭
echo.
echo 웹사이트 URL:
echo https://%USERNAME%.github.io/%REPO_NAME%
echo.
echo (배포에는 몇 분이 걸릴 수 있습니다)
echo.
pause

