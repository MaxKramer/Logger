SHELL := /bin/bash
XCODE_WORKSPACE = Example/Timber.xcworkspace
XCODE_SCHEME = Timber-Example

test:
	set -o pipefail && xcodebuild test -workspace $(XCODE_WORKSPACE) -scheme $(XCODE_SCHEME) -sdk iphonesimulator9.3 | xcpretty        
codecov:
	bash <(curl -s https://codecov.io/bash) -J '^Timber$$'
gendocs:
	bundle exec jazzy -x -workspace,$(PWD)/Example/Timber.xcworkspace,-scheme,Timber-Example
pushdocs:
	git push origin `git subtree split --prefix docs gh-pages`:gh-pages --force
	git subtree push --prefix docs origin gh-pages
