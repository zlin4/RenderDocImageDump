if [[ "$DOCS_BUILD" == "1" ]]; then

	echo "== Compiling documentation build.";

	. ./scripts/travis/docs_compile.sh;

else

	echo "== Compiling code build.";

	if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then

		if [[ "$LINUX_BUILD" == "1" ]]; then

			. ./scripts/travis/linux_compile.sh;

		elif [[ "$ANDROID_BUILD" == "1" ]]; then

			. ./scripts/travis/android_compile.sh;

		else

			echo "Unknown configuration building on linux - not targetting linux or android.";
			exit 1;

		fi

	elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then

		if [[ "$APPLE_BUILD" == "1" ]]; then

			. ./scripts/travis/osx_compile.sh

		else

			echo "Unknown configuration building on OSX - not targetting OSX.";
			exit 1;

		fi

	else

		echo "Unknown travis OS: $TRAVIS_OS_NAME.";
		exit 1;

	fi

fi
