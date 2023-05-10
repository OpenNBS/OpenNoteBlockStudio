Icon "${ICON_FILE}"
RequestExecutionLevel user
OutFile "${INSTALLER_FILENAME}"
SilentInstall silent
Section "${PRODUCT_NAME}"
    SetOutPath `$LOCALAPPDATA\__${PRODUCT_NAME}__`
    File /r "${SOURCE_DIR}\*.*"
    ExecWait `$LOCALAPPDATA\__${PRODUCT_NAME}__\${EXE_NAME}.exe`
    RMDir /r `$LOCALAPPDATA\__${PRODUCT_NAME}__`
SectionEnd
