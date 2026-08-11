#!/usr/bin/env bash
set -x

cd /openedx/edx-platform

# Create test root folder, required for tests
mkdir -p test_root/log/

# Test EOL Modifications
DJANGO_SETTINGS_MODULE=cms.envs.test EDXAPP_TEST_MONGO_HOST=mongodb pytest --exitfirst --full-trace --verbose \
    cms/djangoapps/contentstore/views/tests/test_videos.py
