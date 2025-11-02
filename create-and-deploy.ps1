# GitHub 저장소 생성 및 배포 자동화 스크립트
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub 저장소 생성 및 배포" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# GitHub CLI 인증 확인
Write-Host "[1/5] GitHub 인증 확인 중..." -ForegroundColor Yellow
$authStatus = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "GitHub 인증이 필요합니다." -ForegroundColor Red
    Write-Host ""
    Write-Host "브라우저에서 인증을 완료해주세요:" -ForegroundColor Yellow
    $loginResult = gh auth login --web --git-protocol https --hostname github.com 2>&1
    Write-Host $loginResult
    Write-Host ""
    Write-Host "인증 완료 후 Enter 키를 누르세요..." -ForegroundColor Cyan
    Read-Host
}

# 인증 재확인
gh auth status
if ($LASTEXITCODE -ne 0) {
    Write-Host "인증에 실패했습니다. 스크립트를 종료합니다." -ForegroundColor Red
    exit 1
}

Write-Host "✓ 인증 완료" -ForegroundColor Green
Write-Host ""

# 저장소 생성
$repoName = "myfirstpage"
Write-Host "[2/5] GitHub 저장소 생성 중: $repoName" -ForegroundColor Yellow
$repoResult = gh repo create $repoName --public --source=. --remote=origin --push 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ 저장소 생성 완료" -ForegroundColor Green
} else {
    # 저장소가 이미 존재하는 경우
    if ($repoResult -match "already exists") {
        Write-Host "저장소가 이미 존재합니다. 기존 저장소를 사용합니다." -ForegroundColor Yellow
        
        # 원격 저장소 설정
        git remote remove origin 2>$null
        git remote add origin "https://github.com/lch0611/$repoName.git"
        git branch -M main
        
        Write-Host "[3/5] 기존 코드 푸시 중..." -ForegroundColor Yellow
        git push -u origin main --force
    } else {
        Write-Host "저장소 생성 실패: $repoResult" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""

# GitHub Pages 활성화
Write-Host "[4/5] GitHub Pages 활성화 중..." -ForegroundColor Yellow
$pagesResult = gh api repos/lch0611/$repoName/pages -X POST -f source=@{
    branch = "main"
    path = "/"
} 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ GitHub Pages 활성화 완료" -ForegroundColor Green
} else {
    # 이미 활성화되어 있거나 수동 설정 필요
    Write-Host "GitHub Pages는 수동으로 설정해야 합니다." -ForegroundColor Yellow
    Write-Host "https://github.com/lch0611/$repoName/settings/pages" -ForegroundColor Cyan
    Write-Host "Source: main 브랜치, / (root) 폴더 선택 후 Save" -ForegroundColor Cyan
}

Write-Host ""

# 완료 메시지
Write-Host "========================================" -ForegroundColor Green
Write-Host "✓ 배포 완료!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "저장소 URL:" -ForegroundColor Yellow
Write-Host "https://github.com/lch0611/$repoName" -ForegroundColor Cyan
Write-Host ""
Write-Host "웹사이트 URL (몇 분 후 접속 가능):" -ForegroundColor Yellow
Write-Host "https://lch0611.github.io/$repoName" -ForegroundColor Cyan
Write-Host ""
Write-Host "GitHub Pages가 아직 활성화되지 않았다면:" -ForegroundColor Yellow
Write-Host "https://github.com/lch0611/$repoName/settings/pages" -ForegroundColor Cyan
Write-Host ""

