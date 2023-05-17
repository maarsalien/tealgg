local type double = number
local type long   = integer

global record gg
  record Item
    address: long
    flags: integer
  end

  --[[ 
    Separate from the "ItemOut" record because the "value" is a string, not a number
    for example, when using gg.setValues, the value is a string
    and when using gg.getResults, the value is a number
   ]]
  record ItemIn
    address: long
    flags: integer
    value: string
  end

  record ItemOut
    address: long
    flags: integer
    value: number
  end

  --[[ 
    Separate from the ListItemIn record because the "value" is a number, not a string
    from example, when using gg.addListItems, the value is a string
    and when using gg.getListItems, the value is a number
   ]]
  record ListItemOut
    address: long
    flags: integer
    name: string
    value: number
    freeze: boolean
    freezeType: integer
    freezeFrom: string
    freezeTo: string
  end

  record ListItemIn
    address: long
    flags: integer
    name: string
    value: string
    freeze: boolean
    freezeType: integer
    freezeFrom: string
    freezeTo: string
  end

  record RangeListItem
    state: string
    start: long
    ["end"]: long
    type: string
    name: string
    internalName: string
  end

  record TargetInfoActivity
    name: string
    label: string
  end

  record TargetInfo
    firstInstallTime: integer
    lastUpdateTime: integer
    packageName: string
    sharedUserId: string
    sharedUserLabel: integer
    versionCode: integer
    versionName: string
    activities: {TargetInfoActivity}
    installer: string
    enabledSetting: integer
    backupAgentName: string
    className: string
    dataDir: string
    descriptionRes: integer
    flags: integer
    icon: integer
    labelRes: integer
    logo: integer
    manageSpaceActivityName: string
    name: string
    nativeLibraryDir: string
    permission: string
    processName: string
    publicSourceDir: string
    sourceDir: string
    targetSdkVersion: integer
    taskAffinity: string
    theme: integer
    uid: integer
    label: string
    cmdLine: string
    pid: integer
    x64: boolean
    RSS: integer
  end

  type MakeRequestHeaders = {string: string | {string}}
  record MakeRequestResponse
    content: string
    contentType: string
    contentLength: integer
    url: string
    error: boolean
    code: integer
    contentEncoding: string
    lastModified: integer
    expiration: integer
    requestMethod: string
    message: string
    cipherSuite: string
    headers: MakeRequestHeaders
    usingProxy: boolean
    date: integer
  end

  enum Encoding
    "ISO-8859-1"
    "US-ASCII"
    "UTF-16"
    "UTF-16BE"
    "UTF-16LE"
    "UTF-8"
  end

  enum PromptType
    "number"  
    "text"
    "path"
    "file"
    "new_file"
    "setting"
    "speed"
    "checkbox"
  end

  ANDROID_SDK_INT: string
  ASM_ARM: integer
  ASM_ARM64: integer
  ASM_THUMB: integer
  BUILD: integer
  CACHE_DIR: string
  DUMP_SKIP_SYSTEM_LIBS: integer
  EXT_CACHE_DIR: string
  EXT_FILES_DIR: string
  EXT_STORAGE: string
  FILES_DIR: string
  FREEZE_IN_RANGE: integer
  FREEZE_MAY_DECREASE: integer
  FREEZE_MAY_INCREASE: integer
  FREEZE_NORMAL: integer
  LOAD_APPEND: integer
  LOAD_VALUES: integer
  LOAD_VALUES_FREEZE: integer
  PACKAGE: string
  POINTER_EXECUTABLE: integer
  POINTER_EXECUTABLE_WRITABLE: integer
  POINTER_NO: integer
  POINTER_READ_ONLY: integer
  POINTER_WRITABLE: integer
  PROT_EXEC: integer
  PROT_NONE: integer
  PROT_READ: integer
  PROT_WRITE: integer
  REGION_ANONYMOUS: integer
  REGION_ASHMEM: integer
  REGION_BAD: integer
  REGION_C_ALLOC: integer
  REGION_C_BSS: integer
  REGION_C_DATA: integer
  REGION_C_HEAP: integer
  REGION_CODE_APP: integer
  REGION_CODE_SYS: integer
  REGION_JAVA: integer
  REGION_JAVA_HEAP: integer
  REGION_OTHER: integer
  REGION_PPSSPP: integer
  REGION_STACK: integer
  REGION_VIDEO: integer
  SAVE_AS_TEXT: integer
  SIGN_EQUAL: integer
  SIGN_FUZZY_EQUAL: integer
  SIGN_FUZZY_GREATER: integer
  SIGN_FUZZY_LESS: integer
  SIGN_FUZZY_NOT_EQUAL: integer
  SIGN_GREATER_OR_EQUAL: integer
  SIGN_LESS_OR_EQUAL: integer
  SIGN_NOT_EQUAL: integer
  TAB_MEMORY_EDITOR: integer
  TAB_SAVED_LIST: integer
  TAB_SEARCH: integer
  TAB_SETTINGS: integer
  TYPE_AUTO: integer
  TYPE_BYTE: integer
  TYPE_DOUBLE: integer
  TYPE_DWORD: integer
  TYPE_FLOAT: integer
  TYPE_QWORD: integer
  TYPE_WORD: integer
  TYPE_XOR: integer
  VERSION: string
  VERSION_INT: integer

  addListItems: function(item: {any: ListItemIn}): boolean | string

  alert: function(message: string, positive: string, negative: string, neutral: string): integer
  allocatePage: function(mode: integer, address: integer): integer | string
  bytes: function(text: string, encoding: Encoding): {integer}

  --TODO: figure out how to type this
  choice: function(items: {string}, selected: integer, message: string): integer | nil
  choice: function(items: {string:string}, selected: string, message: string): string | nil

  clearList: function(): boolean | string
  clearResults: function(): nil
  copyMemory: function(from: integer, to: integer, bytes: integer): boolean | string
  copyText: function(text: string, fixLocale: boolean): nil
  disasm: function(type: integer, address: integer, opcode: integer): string
  dumpMemory: function(from: integer, to: integer, dir: string, flags: integer): boolean | string
  editAll: function(value: string, type: integer): integer | string
  getActiveTab: function(): integer
  getFile: function(): string
  getLine: function(): integer
  getListItems: function(): {ListItemOut}
  getLocale: function(): string
  getRanges: function(): integer
  getRangesList: function(filter: string): {RangeListItem}
  
  getResults: function(
    maxCount:   integer,
    skip:       integer,
    addressMin: integer,
    addressMax: integer,
    valueMin:   string,
    valueMax:   string,
    type:       integer,
    fractional: string,
    pointer:    integer
  ): {ItemOut} | string

  getResultsCount: function(): integer
  getSelectedElements: function(): {integer} | string
  getSelectedListItems: function(): {ListItemOut} | string
  getSelectedResults: function(): {ItemOut} | string
  getSpeed: function(): double
  getTargetInfo: function(): TargetInfo | nil
  getTargetPackage: function(): string | nil

  --TODO: figure out how to type this
  getValues: function(values: {ListItemIn}): {ItemOut} | string
  getValues: function(values: {ListItemOut}): {ItemOut} | string
  
  gotoAddress: function(address: integer): nil
  hideUiButton: function(): nil
  isClickedUiButton: function(): boolean | nil
  isPackageInstalled: function(pkg: string): boolean
  isProcessPaused: function(): boolean
  isVisible: function(): boolean
  loadList: function(file: string, flags: integer): boolean | string
  
  loadResults: function(results: ListItemIn): boolean | string
  loadResults: function(results: ListItemOut): boolean | string

  makeRequest: function(url: string, headers: MakeRequestHeaders, data: string): MakeRequestResponse | string

  --TODO: figure out how to type this
  multiChoice: function(items: {string}, selected: {integer}, message: string): {integer} | nil

  numberFromLocale: function(num: string): string
  numberToLocale: function(num: string): string
  processKill: function(): boolean
  processPause: function(): boolean
  processResume: function(): boolean
  processToggle: function(): boolean

  --TODO: figure out how to type this
  prompt: function(prompts: {string}, defaults: {string|number}, types: {PromptType}): {string|number} | nil

  refineAddress: function(text: string, mask: integer, type: integer, sign: integer, memoryFrom: integer, memoryTo: integer, limit: integer): boolean | string
  refineNumber: function(text: string, type: integer, encrypted: boolean, sign: integer, memoryFrom: integer, memoryTo: integer, limit: integer): boolean | string
  removeListItems: function(items: {Item}): boolean | string
  removeListItems: function(items: {integer}): boolean | string
  removeResults: function(items: {Item}): boolean | string
  require: function(version: string, build: integer): nil
  saveList: function(file: string, flags: integer): boolean | string
  saveVariable: function(variable: any, filename: string): boolean | string
  searchAddress: function(text: string, mask: long, type: integer, sign: integer, memoryFrom: long, memoryTo: long, limit: long): boolean | string
  searchFuzzy: function(difference: string, sign: integer, type: integer, memoryFrom: long, memoryTo: long, limit: long): boolean | string
  searchNumber: function(text: string, type: integer, encrypted: boolean, sign: integer, memoryFrom: long, memoryTo: long, limit: long): boolean | string
  searchPointer: function(maxOffset: integer, memoryFrom: long, memoryTo: long, limit: long): boolean | string
  setRanges: function(ranges: integer): nil
  setSpeed: function(speed: double): boolean | string
  setValues: function(values: {ListItemIn}): boolean | string
  setVisible: function(visible: boolean): nil
  showUiButton: function(): nil
  skipRestoreState: function(): nil
  sleep: function(milliseconds: integer): nil
  startFuzzy: function(type: integer, memoryFrom: long, memoryTo: long, limit: long): boolean | string
  timeJump: function(time: string): boolean | string
  toast: function(text: string, fast: boolean): nil
  unrandomizer: function(qword: long, qincr: long, double_: double, dincr: double): boolean | string
end
