# GitHub Pages 배포 가이드 - myfirstpage

## 빠른 배포 방법

### 1단계: GitHub 저장소 생성 (1분)

1. **아래 링크를 클릭하거나 브라우저에서 직접 이동:**
   ```
   https://github.com/new
   ```

2. **다음 정보 입력:**
   - Repository name: `myfirstpage`
   - Description: (선택사항) "My Portfolio Website"
   - **Public** 선택 (중요!)
   - ☐ **Add a README file** 체크 해제 (이미 README.md 있음)
   - ☐ Add .gitignore: None
   - ☐ Choose a license: None

3. **"Create repository" 버튼 클릭**

### 2단계: 자동 배포 (터미널에서 실행)

저장소를 생성한 후, 아래 명령어를 실행하세요:

```bash
cd "c:\Users\chlee\OneDrive\Desktop\google-drive\02_Projects\50_Learn\cursor-ai-30-programs\practice01"
git remote add origin https://github.com/lch0611/myfirstpage.git
git branch -M main
git push -u origin main
```

또는 PowerShell 스크립트 실행:
```powershell
.\deploy.ps1
```

### 3단계: GitHub Pages 활성화

1. **GitHub 저장소 페이지로 이동:**
   ```
   https://github.com/lch0611/myfirstpage
   ```

2. **Settings 클릭** (저장소 상단 메뉴)

3. **왼쪽 사이드바에서 "Pages" 클릭**

4. **Source 섹션:**
   - Branch: `main` 선택
   - Folder: `/ (root)` 선택
   - **Save** 클릭

### 4단계: 배포 확인

몇 분 후 (최대 10분) 다음 주소로 접속:
```
https://lch0611.github.io/myfirstpage
```

## 문제 해결

- **403 에러**: 저장소가 Public인지 확인
- **404 에러**: GitHub Pages가 활성화되었는지, 배포 완료까지 몇 분 기다려보기
- **이미지가 안 보임**: P.png 파일이 저장소에 포함되었는지 확인

## 업데이트 방법

파일 수정 후 다시 배포:
```bash
git add .
git commit -m "Update portfolio"
git push
```

GitHub Pages가 자동으로 재배포합니다!

