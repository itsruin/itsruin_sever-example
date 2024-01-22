# itsruin_sever-example
Server-Example for FiveM (Standalone)

## 소개
**CitizenFX(이하 'CFX')** 에서 제공하는 FiveM 게임 서비스를 이용한 국내 RolePlay(RP) 서버인 **HYBE**에서 사용되었던 서버 빌드 구조입니다.<br/>
대부분의 서버에서 사용하는 무분별하고 복잡한 구조를 재구성하였으며, 이로인해 보다 체계적이고 편리한 시스템 관리가 가능합니다.<br/>

## 설정 방법
1. 해당 파일을 다운로드합니다.
2. (Windows의 경우) https://runtime.fivem.net/artifacts/fivem/build_server_windows/master 에서 `LATEST RECOMMENDED (번호)`버튼을 눌러 빌드를 다운로드합니다.
3. `builders/v7290`을 `v번호`형식으로 변경합니다.
4. `start_v3095.bat`파일을 열어 코드에 `v7290`이라고 기록된 부분을 `v번호`로 변경합니다.

** 이미 다운로드 되어있는 `v7290`버전의 빌드 파일의 경우, **2024-01-08 08:49:45**에 **LATEST RECOMMENDED**로 인증된 파일입니다.<br/>
** `start_v3095.bat`파일에 설정되어있는 `+set sv_enforceGameBuild 3095`는 GTA 온라인 `The Chop Shop`버전의 빌드입니다.

## 구성 및 역할
`assets` 서버 리스트에 표시되는 로고의 이미지 파일을 보관합니다.<br/>

`builders` CFX에서 제공하는 Windows 빌드 파일을 보관합니다.<br/>
`builders/vNNNN` 빌드의 버전을 표시하며, 이 내부에 파일을 적용합니다.<br/>

`resources` 서버에 적용되는 리소스들을 보관합니다.<br/>
`resources/[citizenfx]` CFX에서 제공하는 기본적인 서버 파일을 보관합니다. 다운로드 & 압축 작업이 이미 되어있습니다.<br/>
- `[citizenfx_builders]` 폴더에는 **webpack** 또는 **yarn**과 같은 리소스를 추가할 수 있습니다. (필수 X)<br/>
- `[citizenfx_compressions]` 폴더에는 **basic-gamemode** 리소스와 **fivem-map-hipster**, **fivem-map-skater**가 압축되어 있습니다.<br/>
- `[citizenfx_managers]` 폴더에는 **mapmanager**, **sessionmanager**, **spawnmanager**파일이 적용되어 있습니다.<br/>

`resources/[local]` 서버에 존재하는 모든 스크립트 파일을 보관합니다.<br/>
- `[anticheat]` 폴더에는 서버에서 사용하는 보안 시스템을 적용합니다.<br/>
- `[dependency]` 폴더에는 서버에 적용한 스크립트가 요구하는 리소스를 적용합니다.<br/>
- `[escrow]` 폴더에는 **Asset Escrow** 시스템이 사용된 스크립트를 적용합니다.<br/>
- `[framework]` 폴더에는 **vRP, ESX, QBCore**와 같은 프레임워크를 적용합니다.<br/>
- `[source]` 폴더에는 일반적인 스크립트를 적용합니다.<br/>

`resources/[stream]` 서버에 존재하는 모든 Stream (맵, 차량, 스킨 등) 파일을 보관합니다.<br/>
- `[map]` 폴더에는 맵 파일을 적용합니다.<br/>
- `[peds]` 폴더에는 PED, EUP 파일을 적용합니다.<br/>
- `[scaleforms]` 폴더에는 GFX (커스텀 폰트, 미니맵 디자인 등) 파일을 적용합니다.<br/>
- `[vehicles]` 폴더에는 차량 파일을 적용합니다.<br/>

`이 CFG 파일에 변동사항을 적용하는 비효율적인 문제를 해결할 수 있습니다.<br/>
현재 적용되어 있는 해당 파일의 구조는 다음과 같습니다.

```cfg
ensure [citizenfx]

ensure [anticheat]
ensure [dependency]
ensure [framework] # load first than [drm], [escrow], [source]
ensure [drm]
ensure [escrow]
ensure [source]

ensure [maps]
ensure [peds]
ensure [scaleforms]
ensure [vehicles]
```

`[framework]`는 서버에 핵심이 되는 프레임워크가 저장되는 곳입니다. 이 프레임워크와 기타 시스템이 정상적으로 작동하기 위해서는 `[framework]`가 해당 프레임워크와 연결될 수 있는 시스템인 `[drm]`, `[escrow]`, `[source]`폴더보다 먼저 실행되어야 합니다.<br/><br/>
추가적으로, `.. non use`라는 폴더를 범주 폴더 안에 만들어 두고, 사용하지 않는 리소스를 이곳에 추가한다면 해당 리소스는 서버를 구동할 때 시작되지 않습니다.<br/>
CFX에서는 폴더에 띄어쓰기가 적용되어 있는 경우, 해당 리소스를 인식하지 않는 규칙을 가지고 있기 때문입니다.

## 시스템 다운로드 링크
- CitizenFX Windows 빌드 파일 :: https://runtime.fivem.net/artifacts/fivem/build_server_windows/master
- CitizenFX 서버 데이터 파일 :: https://github.com/citizenfx/cfx-server-data
