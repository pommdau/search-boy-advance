# 変数
PRODUCT_NAME := AdvancedSearchBoy
PROJECT_NAME := ${PRODUCT_NAME}.xcodeproj
SCHEME_NAME := ${PRODUCT_NAME}
UI_TESTS_TARGET_NAME := ${PRODUCT_NAME}UITests

TEST_SDK := iphonesimulator  # 最新のSDK
TEST_CONFIGURATION := Debug
# 下記のリストを取得したいがどうやるのか…？
TEST_PLATFORM := iOS Simulator
TEST_DEVICE ?= iPhone 13 Pro Max
TEST_OS ?= 15.2
TEST_DESTINATION := 'platform=${TEST_PLATFORM},name=${TEST_DEVICE},OS=${TEST_OS}'

.PHONY: ikeh
ikeh:
	echo "hello makefile"

.PHONY: open
open: # ワークスペースをXcodeで開く
	open ./${WORKSPACE_NAME}
	
.PHONY: build-debug
build-debug: # デバッグビルド
	set -o pipefail \
&& xcodebuild \
-project ${PROJECT_NAME} \
-sdk ${TEST_SDK} \
-configuration ${TEST_CONFIGURATION} \
-scheme ${SCHEME_NAME} \
-clonedSourcePackagesDirPath SwiftPMCache \
build

.PHONY: test
test: # 単体テスト
	set -o pipefail \
&& xcodebuild \
-sdk ${TEST_SDK} \
-configuration ${TEST_CONFIGURATION} \
-project ${PROJECT_NAME} \
-scheme ${SCHEME_NAME} \
-clonedSourcePackagesDirPath SwiftPMCache \
-destination ${TEST_DESTINATION} \
-skip-testing:${UI_TESTS_TARGET_NAME} \
clean test