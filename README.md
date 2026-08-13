# Histogram Equalizations — Android APK

This project packages the supplied `CLAHE_widget_beautify_shadow_protected_WITH_SEPARATE_PIXEL_INSPECTION(2).html`
as an Android app using Capacitor.

The web application itself is kept as the supplied HTML file in `www/index.html`.
The CLAHE processing and separate pixel-inspection feature are not rewritten by this wrapper.

## What the GitHub workflow does

1. Installs Node.js.
2. Installs Java.
3. Installs Capacitor.
4. Creates the Android project.
5. Copies `www/index.html` into the Android app.
6. Builds a debug APK.
7. Uploads `app-debug.apk` as a GitHub Actions artifact.

## GitHub steps

### 1. Create a repository

Create a new GitHub repository, for example:

`histogram-equalizations`

You can keep it private if you want.

### 2. Upload this project's files

Extract this ZIP and upload all of its contents to the root of the GitHub repository.

The important structure is:

```text
Histogram_Equalizations_Android/
├── www/
│   └── index.html
├── .github/
│   └── workflows/
│       └── build-apk.yml
├── package.json
├── capacitor.config.json
├── .gitignore
└── README.md
```

If you are uploading through GitHub's web interface, upload the files/folders so that
`.github/workflows/build-apk.yml` is exactly at that path relative to the repository root.

### 3. Run the GitHub build

Open the repository and select:

`Actions` → `Build Histogram Equalizations APK`

Then click:

`Run workflow`

Select the `main` branch and click the green `Run workflow` button.

You can also trigger it automatically by pushing to `main`.

### 4. Wait for the build

Open the running workflow.

The steps should complete approximately as:

- Checkout repository
- Set up Node.js
- Set up Java
- Install web and Capacitor dependencies
- Add Android platform
- Copy web app into Android project
- Build debug APK
- Upload APK

### 5. Download the APK

After the workflow succeeds:

`Actions` → open the completed workflow run

Scroll to the bottom to:

`Artifacts`

Download:

`Histogram-Equalizations-APK`

Extract the downloaded artifact ZIP.

Inside it you will find:

`app-debug.apk`

Transfer that APK to your Android phone and install it.

## If Android blocks installation

If Android says installation from this source is not allowed, enable permission for
the browser/file manager you used to open the APK under Android's
"Install unknown apps" setting.

## Important

This workflow produces a **debug APK**. It is suitable for testing/installing on your
phone.

For Google Play Store publishing, you should later create a properly signed release
build/AAB with your own application signing key.

## Changing the app name

The visible app name is configured in:

`capacitor.config.json`

Currently:

`Histogram Equalizations`

## Changing the package/application ID

The Android application ID is:

`com.example.histogramequalizations`

Change it before publishing if you want a unique permanent application ID.

## Updating the HTML later

Replace:

`www/index.html`

with the new version of the widget, commit/push it, and run the GitHub Action again.
The workflow recreates the Android project and packages the updated HTML.
