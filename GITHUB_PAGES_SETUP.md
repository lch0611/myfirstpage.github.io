# GitHub Pages 배포 가이드

## 1단계: Git 사용자 정보 설정

터미널에서 다음 명령어를 실행하세요:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

또는 이 저장소에만 적용하려면:
```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

## 2단계: 첫 커밋 생성

```bash
git commit -m "Initial commit: Portfolio website"
```

## 3단계: GitHub 저장소 생성

1. [GitHub.com](https://github.com)에 로그인
2. 오른쪽 상단의 "+" 버튼 클릭 → "New repository" 선택
3. 저장소 이름 입력 (예: `my-portfolio`)
4. **Public**으로 설정 (GitHub Pages 무료 버전은 Public 저장소에서만 동작)
5. **"Add a README file" 체크하지 않기** (이미 README.md가 있음)
6. "Create repository" 클릭

## 4단계: 로컬 저장소를 GitHub에 연결

GitHub에서 생성한 저장소 페이지에서 나타나는 명령어 중 다음을 실행:

```bash
git remote add origin https://github.com/[사용자명]/[저장소명].git
git branch -M main
git push -u origin main
```

또는 SSH를 사용하는 경우:
```bash
git remote add origin git@github.com:[사용자명]/[저장소명].git
git branch -M main
git push -u origin main
```

## 5단계: GitHub Pages 활성화

1. GitHub 저장소 페이지로 이동
2. 상단 메뉴에서 **"Settings"** 클릭
3. 왼쪽 사이드바에서 **"Pages"** 클릭
4. Source 섹션에서:
   - Branch를 **"main"** 선택
   - Folder를 **"/ (root)"** 선택
5. **"Save"** 클릭

## 6단계: 배포 확인

몇 분 후 다음 주소로 접속:
```
https://[사용자명].github.io/[저장소명]
```

예: 저장소 이름이 `my-portfolio`이고 사용자명이 `john`이면
```
https://john.github.io/my-portfolio
```

## 문제 해결

- **페이지가 표시되지 않으면**: 몇 분 더 기다리거나, Settings → Pages에서 배포 상태 확인
- **이미지가 보이지 않으면**: 이미지 파일 경로 확인 (`P.png` 파일이 저장소에 포함되어 있는지 확인)
- **404 에러**: 저장소 이름과 URL이 정확한지 확인

## 참고사항

- 첫 배포에는 최대 10분까지 걸릴 수 있습니다
- 이후 파일 변경 시 자동으로 재배포됩니다
- 커스텀 도메인도 설정할 수 있습니다 (Settings → Pages → Custom domain)

