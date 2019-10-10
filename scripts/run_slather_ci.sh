if [[ -f Gemfile.lock ]]; then
    GEM_BUNDLER_VERSION=$(grep -A1 -E -i -w '(BUNDLED WITH){1,1}' Gemfile.lock | grep -E -i -w "[0-9\.]{1,}" | xargs)
	CURRENT_BUNDLER_VERSION=$(bundle --version | grep -o -E -i -w "[0-9\.]{1,}" | xargs)

    if [[ $GEM_BUNDLER_VERSION != $CURRENT_BUNDLER_VERSION ]]; then
        gem uninstall bundler --force --executables
        gem install bundler -v=$GEM_BUNDLER_VERSION --force
    fi
fi

bundle install
bundle exec slather coverage --show
