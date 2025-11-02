# GitHub 저장소 생성 및 배포 스크립트
$repoName = "myfirstpage"
$username = "lch0611"
$repoUrl = "https://github.com/$username/$repoName"

Write-Host "GitHub 저장소 확인 중..." -ForegroundColor Yellow

# 저장소 존재 여부 확인
try {
    $response = Invoke-WebRequest -Uri "$repoUrl" -Method Head -ErrorAction SilentlyContinue
    Write-Host "저장소가 이미 존재합니다." -ForegroundColor Green
} catch {
    Write-Host "저장소가 존재하지 않습니다. GitHub 웹에서 생성해야 합니다." -ForegroundColor Red
    Write-Host ""
    Write-Host "다음 단계를 따라주세요:" -ForegroundColor Yellow
    Write-Host "1. https://github.com/new 에서 새 저장소 생성" -ForegroundColor Cyan
    Write-Host "2. 저장소 이름: $repoName" -ForegroundColor Cyan
    Write-Host "3. Public으로 설정" -ForegroundColor Cyan
    Write-Host "4. README 추가하지 않기" -ForegroundColor Cyan
    Write-Host "5. 저장소 생성 후 Enter 키를 누르세요..." -ForegroundColor Cyan
    Read-Host
}

# Git 원격 저장소 추가 및 푸시
Write-Host ""
Write-Host "Git 원격 저장소 설정 중..." -ForegroundColor Yellow

# 기존 원격 저장소 제거 (있다면)
git remote remove origin 2>$null

# 원격 저장소 추가
git remote add origin "$repoUrl.git"
Write-Host "원격 저장소 추가 완료: $repoUrl" -ForegroundColor Green

# 브랜치를 main으로 변경
git branch -M main

Write-Host ""
Write-Host "GitHub에 푸시 중..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "배포 완료!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "GitHub Pages 설정:" -ForegroundColor Yellow
    Write-Host "1. https://github.com/$username/$repoName/settings/pages 접속" -ForegroundColor Cyan
    Write-Host "2. Source: main 브랜치, / (root) 폴더 선택" -ForegroundColor Cyan
    Write-Host "3. Save 클릭" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "웹사이트 URL: https://$username.github.io/$repoName" -ForegroundColor Green
    Write-Host "(배포에는 몇 분이 걸릴 수 있습니다)" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "푸시 실패. 저장소가 생성되었는지 확인해주세요." -ForegroundColor Red
    Write-Host "또는 저장소를 먼저 생성해주세요: https://github.com/new" -ForegroundColor Yellow
}

