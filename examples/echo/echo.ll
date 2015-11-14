; ModuleID = 'echo.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.EchoTest = type { %class.Module, %class.Echo*, i32, %"class.EchoTest::drive" }
%class.Module = type { %class.Rule*, %class.Module*, i64 }
%class.Rule = type { i32 (...)**, %class.Rule* }
%class.Echo = type { %class.Module, %class.Fifo*, %class.EchoIndication*, i32, %"class.Echo::respond" }
%class.Fifo = type { i32 (...)**, %class.Module }
%class.EchoIndication = type { i8 }
%"class.Echo::respond" = type { %"class.Echo::respond::respond1", %"class.Echo::respond::respond2" }
%"class.Echo::respond::respond1" = type { %class.Rule, %class.Echo* }
%"class.Echo::respond::respond2" = type { %class.Rule, %class.Echo* }
%"class.EchoTest::drive" = type { %class.Rule, %class.EchoTest* }
%class.Fifo1 = type <{ %class.Fifo, i32, i8, [3 x i8] }>

$_ZN8EchoTestC2Ev = comdat any

$_ZN8EchoTestD2Ev = comdat any

$_ZN6ModuleC2Em = comdat any

$_ZN14EchoIndicationC2Ev = comdat any

$_ZN4EchoC2EP14EchoIndication = comdat any

$_ZN8EchoTest5driveC2EPS_ = comdat any

$_ZN5Fifo1IiEC2Ev = comdat any

$_ZN4Echo7respondC2EPS_ = comdat any

$_ZN4FifoIiEC2Em = comdat any

$_ZN5Fifo1IiED2Ev = comdat any

$_ZN5Fifo1IiED0Ev = comdat any

$_ZN5Fifo1IiE8enq__RDYEv = comdat any

$_ZN5Fifo1IiE3enqEi = comdat any

$_ZN5Fifo1IiE8deq__RDYEv = comdat any

$_ZN5Fifo1IiE3deqEv = comdat any

$_ZN5Fifo1IiE10first__RDYEv = comdat any

$_ZN5Fifo1IiE5firstEv = comdat any

$_ZNK5Fifo1IiE8notEmptyEv = comdat any

$_ZNK5Fifo1IiE7notFullEv = comdat any

$_ZN4FifoIiED2Ev = comdat any

$_ZN4FifoIiED0Ev = comdat any

$_ZN4FifoIiE8enq__RDYEv = comdat any

$_ZN4FifoIiE8deq__RDYEv = comdat any

$_ZN4FifoIiE10first__RDYEv = comdat any

$_ZN4Echo7respond8respond1C2EPS_ = comdat any

$_ZN4Echo7respond8respond2C2EPS_ = comdat any

$_ZN4RuleC2Ev = comdat any

$_ZN6Module7addRuleEP4Rule = comdat any

$_ZN4Echo7respond8respond13RDYEv = comdat any

$_ZN4Echo7respond8respond13ENAEv = comdat any

$_ZN4Echo7respond8respond23RDYEv = comdat any

$_ZN4Echo7respond8respond23ENAEv = comdat any

$_ZN8EchoTest5drive3RDYEv = comdat any

$_ZN8EchoTest5drive3ENAEv = comdat any

$_ZTV5Fifo1IiE = comdat any

$_ZTS5Fifo1IiE = comdat any

$_ZTS4FifoIiE = comdat any

$_ZTS6Module = comdat any

$_ZTI6Module = comdat any

$_ZTI4FifoIiE = comdat any

$_ZTI5Fifo1IiE = comdat any

$_ZTV4FifoIiE = comdat any

$_ZTVN4Echo7respond8respond1E = comdat any

$_ZTSN4Echo7respond8respond1E = comdat any

$_ZTS4Rule = comdat any

$_ZTI4Rule = comdat any

$_ZTIN4Echo7respond8respond1E = comdat any

$_ZTV4Rule = comdat any

$_ZTVN4Echo7respond8respond2E = comdat any

$_ZTSN4Echo7respond8respond2E = comdat any

$_ZTIN4Echo7respond8respond2E = comdat any

$_ZTVN8EchoTest5driveE = comdat any

$_ZTSN8EchoTest5driveE = comdat any

$_ZTIN8EchoTest5driveE = comdat any

@.str = private unnamed_addr constant [19 x i8] c"Heard an echo: %d\0A\00", align 1
@stop_main_program = external global i32, align 4
@echoTest = global %class.EchoTest zeroinitializer, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"[%s:%d] starting %d\0A\00", align 1
@__FUNCTION__.main = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"[%s:%d] ending\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"EchoTest: addr %p size 0x%lx csize 0x%lx\0A\00", align 1
@_ZN6Module5firstE = external global %class.Module*, align 8
@.str.4 = private unnamed_addr constant [57 x i8] c"[%s] add module to list first [%p]=%p this %p size %ld.\0A\00", align 1
@__FUNCTION__._ZN6ModuleC2Em = private unnamed_addr constant [7 x i8] c"Module\00", align 1
@.str.5 = private unnamed_addr constant [46 x i8] c"Echo: this %p size 0x%lx fifo %p csize 0x%lx\0A\00", align 1
@_ZTV5Fifo1IiE = linkonce_odr unnamed_addr constant [12 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI5Fifo1IiE to i8*), i8* bitcast (void (%class.Fifo1*)* @_ZN5Fifo1IiED2Ev to i8*), i8* bitcast (void (%class.Fifo1*)* @_ZN5Fifo1IiED0Ev to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8enq__RDYEv to i8*), i8* bitcast (void (%class.Fifo1*, i32)* @_ZN5Fifo1IiE3enqEi to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8deq__RDYEv to i8*), i8* bitcast (void (%class.Fifo1*)* @_ZN5Fifo1IiE3deqEv to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZN5Fifo1IiE10first__RDYEv to i8*), i8* bitcast (i32 (%class.Fifo1*)* @_ZN5Fifo1IiE5firstEv to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE8notEmptyEv to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE7notFullEv to i8*)], comdat, align 8
@.str.6 = private unnamed_addr constant [27 x i8] c"Fifo1: addr %p size 0x%lx\0A\00", align 1
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS5Fifo1IiE = linkonce_odr constant [10 x i8] c"5Fifo1IiE\00", comdat
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external global i8*
@_ZTS4FifoIiE = linkonce_odr constant [9 x i8] c"4FifoIiE\00", comdat
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS6Module = linkonce_odr constant [8 x i8] c"6Module\00", comdat
@_ZTI6Module = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @_ZTS6Module, i32 0, i32 0) }, comdat
@_ZTI4FifoIiE = linkonce_odr constant { i8*, i8*, i32, i32, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @_ZTS4FifoIiE, i32 0, i32 0), i32 0, i32 1, i8* bitcast ({ i8*, i8* }* @_ZTI6Module to i8*), i64 2050 }, comdat
@_ZTI5Fifo1IiE = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @_ZTS5Fifo1IiE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI4FifoIiE to i8*) }, comdat
@_ZTV4FifoIiE = linkonce_odr unnamed_addr constant [12 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI4FifoIiE to i8*), i8* bitcast (void (%class.Fifo*)* @_ZN4FifoIiED2Ev to i8*), i8* bitcast (void (%class.Fifo*)* @_ZN4FifoIiED0Ev to i8*), i8* bitcast (i1 (%class.Fifo*)* @_ZN4FifoIiE8enq__RDYEv to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (i1 (%class.Fifo*)* @_ZN4FifoIiE8deq__RDYEv to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (i1 (%class.Fifo*)* @_ZN4FifoIiE10first__RDYEv to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)], comdat, align 8
@_ZTVN4Echo7respond8respond1E = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN4Echo7respond8respond1E to i8*), i8* bitcast (i1 (%"class.Echo::respond::respond1"*)* @_ZN4Echo7respond8respond13RDYEv to i8*), i8* bitcast (void (%"class.Echo::respond::respond1"*)* @_ZN4Echo7respond8respond13ENAEv to i8*)], comdat, align 8
@_ZTSN4Echo7respond8respond1E = linkonce_odr constant [25 x i8] c"N4Echo7respond8respond1E\00", comdat
@_ZTS4Rule = linkonce_odr constant [6 x i8] c"4Rule\00", comdat
@_ZTI4Rule = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_ZTS4Rule, i32 0, i32 0) }, comdat
@_ZTIN4Echo7respond8respond1E = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @_ZTSN4Echo7respond8respond1E, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI4Rule to i8*) }, comdat
@_ZTV4Rule = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTI4Rule to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)], comdat, align 8
@.str.7 = private unnamed_addr constant [88 x i8] c"[%s] add rule to module list rfirst [%p]=%p this %p rule %p rulevptr %p &rule->next %p\0A\00", align 1
@__FUNCTION__._ZN6Module7addRuleEP4Rule = private unnamed_addr constant [8 x i8] c"addRule\00", align 1
@_ZTVN4Echo7respond8respond2E = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN4Echo7respond8respond2E to i8*), i8* bitcast (i1 (%"class.Echo::respond::respond2"*)* @_ZN4Echo7respond8respond23RDYEv to i8*), i8* bitcast (void (%"class.Echo::respond::respond2"*)* @_ZN4Echo7respond8respond23ENAEv to i8*)], comdat, align 8
@_ZTSN4Echo7respond8respond2E = linkonce_odr constant [25 x i8] c"N4Echo7respond8respond2E\00", comdat
@_ZTIN4Echo7respond8respond2E = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @_ZTSN4Echo7respond8respond2E, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI4Rule to i8*) }, comdat
@_ZTVN8EchoTest5driveE = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN8EchoTest5driveE to i8*), i8* bitcast (i1 (%"class.EchoTest::drive"*)* @_ZN8EchoTest5drive3RDYEv to i8*), i8* bitcast (void (%"class.EchoTest::drive"*)* @_ZN8EchoTest5drive3ENAEv to i8*)], comdat, align 8
@_ZTSN8EchoTest5driveE = linkonce_odr constant [18 x i8] c"N8EchoTest5driveE\00", comdat
@_ZTIN8EchoTest5driveE = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @_ZTSN8EchoTest5driveE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI4Rule to i8*) }, comdat
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_echo.cpp, i8* null }]

; Function Attrs: nounwind
define void @_ZN14EchoIndication4echoEi(i32 %v) #0 align 2 {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !316, metadata !317), !dbg !318
  %0 = load i32, i32* %v.addr, align 4, !dbg !319
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !320
  store i32 1, i32* @stop_main_program, align 4, !dbg !321
  ret void, !dbg !322
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
entry:
  call void @_ZN8EchoTestC2Ev(%class.EchoTest* @echoTest), !dbg !323
  %0 = call i32 @atexit(void ()* @__dtor_echoTest) #3, !dbg !323
  ret void, !dbg !323
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTestC2Ev(%class.EchoTest* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoTest*, align 8
  store %class.EchoTest* %this, %class.EchoTest** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %this.addr, metadata !324, metadata !317), !dbg !325
  %this1 = load %class.EchoTest*, %class.EchoTest** %this.addr
  %0 = bitcast %class.EchoTest* %this1 to %class.Module*, !dbg !326
  call void @_ZN6ModuleC2Em(%class.Module* %0, i64 96), !dbg !327
  %echo = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this1, i32 0, i32 1, !dbg !328
  %call = call noalias i8* @_Znwm(i64 96) #7, !dbg !329
  %1 = bitcast i8* %call to %class.Echo*, !dbg !329
  %call2 = call noalias i8* @_Znwm(i64 1) #7, !dbg !330
  %2 = bitcast i8* %call2 to %class.EchoIndication*, !dbg !330
  call void @_ZN14EchoIndicationC2Ev(%class.EchoIndication* %2), !dbg !331
  call void @_ZN4EchoC2EP14EchoIndication(%class.Echo* %1, %class.EchoIndication* %2), !dbg !332
  store %class.Echo* %1, %class.Echo** %echo, align 8, !dbg !328
  %x = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this1, i32 0, i32 2, !dbg !333
  store i32 7, i32* %x, align 4, !dbg !333
  %driveRule = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this1, i32 0, i32 3, !dbg !334
  call void @_ZN8EchoTest5driveC2EPS_(%"class.EchoTest::drive"* %driveRule, %class.EchoTest* %this1), !dbg !334
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), %class.EchoTest* %this1, i64 64, i64 64), !dbg !335
  ret void, !dbg !337
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTestD2Ev(%class.EchoTest* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoTest*, align 8
  store %class.EchoTest* %this, %class.EchoTest** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %this.addr, metadata !338, metadata !317), !dbg !339
  %this1 = load %class.EchoTest*, %class.EchoTest** %this.addr
  ret void, !dbg !340
}

; Function Attrs: nounwind
define internal void @__dtor_echoTest() #0 section ".text.startup" {
entry:
  call void @_ZN8EchoTestD2Ev(%class.EchoTest* @echoTest), !dbg !341
  ret void, !dbg !341
}

; Function Attrs: nounwind
declare i32 @atexit(void ()*) #3

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !342, metadata !317), !dbg !343
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !344, metadata !317), !dbg !345
  %0 = load i32, i32* %argc.addr, align 4, !dbg !346
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__FUNCTION__.main, i32 0, i32 0), i32 86, i32 %0), !dbg !347
  %1 = load i32, i32* %argc.addr, align 4, !dbg !348
  %cmp = icmp ne i32 %1, 1, !dbg !350
  br i1 %cmp, label %if.then, label %if.end, !dbg !351

if.then:                                          ; preds = %entry
  call void @_Z16run_main_programv(), !dbg !352
  br label %if.end, !dbg !352

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__FUNCTION__.main, i32 0, i32 0), i32 89), !dbg !353
  ret i32 0, !dbg !354
}

declare void @_Z16run_main_programv() #2

; Function Attrs: nounwind
define linkonce_odr void @_ZN6ModuleC2Em(%class.Module* %this, i64 %size) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Module*, align 8
  %size.addr = alloca i64, align 8
  store %class.Module* %this, %class.Module** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Module** %this.addr, metadata !355, metadata !317), !dbg !356
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !357, metadata !317), !dbg !358
  %this1 = load %class.Module*, %class.Module** %this.addr
  %rfirst = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !359
  store %class.Rule* null, %class.Rule** %rfirst, align 8, !dbg !359
  %next = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 1, !dbg !360
  %0 = load %class.Module*, %class.Module** @_ZN6Module5firstE, align 8, !dbg !361
  store %class.Module* %0, %class.Module** %next, align 8, !dbg !360
  %size2 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 2, !dbg !362
  %1 = load i64, i64* %size.addr, align 8, !dbg !363
  store i64 %1, i64* %size2, align 8, !dbg !362
  %2 = load %class.Module*, %class.Module** @_ZN6Module5firstE, align 8, !dbg !364
  %3 = load i64, i64* %size.addr, align 8, !dbg !366
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__FUNCTION__._ZN6ModuleC2Em, i32 0, i32 0), %class.Module** @_ZN6Module5firstE, %class.Module* %2, %class.Module* %this1, i64 %3), !dbg !367
  store %class.Module* %this1, %class.Module** @_ZN6Module5firstE, align 8, !dbg !368
  ret void, !dbg !369
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #4

; Function Attrs: nounwind
define linkonce_odr void @_ZN14EchoIndicationC2Ev(%class.EchoIndication* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoIndication*, align 8
  store %class.EchoIndication* %this, %class.EchoIndication** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoIndication** %this.addr, metadata !370, metadata !317), !dbg !371
  %this1 = load %class.EchoIndication*, %class.EchoIndication** %this.addr
  ret void, !dbg !372
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4EchoC2EP14EchoIndication(%class.Echo* %this, %class.EchoIndication* %ind) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Echo*, align 8
  %ind.addr = alloca %class.EchoIndication*, align 8
  store %class.Echo* %this, %class.Echo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Echo** %this.addr, metadata !373, metadata !317), !dbg !374
  store %class.EchoIndication* %ind, %class.EchoIndication** %ind.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoIndication** %ind.addr, metadata !375, metadata !317), !dbg !376
  %this1 = load %class.Echo*, %class.Echo** %this.addr
  %0 = bitcast %class.Echo* %this1 to %class.Module*, !dbg !377
  call void @_ZN6ModuleC2Em(%class.Module* %0, i64 96), !dbg !378
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 1, !dbg !379
  %call = call noalias i8* @_Znwm(i64 40) #7, !dbg !380
  %1 = bitcast i8* %call to %class.Fifo1*, !dbg !380
  call void @_ZN5Fifo1IiEC2Ev(%class.Fifo1* %1), !dbg !381
  %2 = bitcast %class.Fifo1* %1 to %class.Fifo*, !dbg !380
  store %class.Fifo* %2, %class.Fifo** %fifo, align 8, !dbg !379
  %ind2 = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 2, !dbg !382
  %3 = load %class.EchoIndication*, %class.EchoIndication** %ind.addr, align 8, !dbg !383
  store %class.EchoIndication* %3, %class.EchoIndication** %ind2, align 8, !dbg !382
  %respondRule = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 4, !dbg !384
  call void @_ZN4Echo7respondC2EPS_(%"class.Echo::respond"* %respondRule, %class.Echo* %this1), !dbg !384
  %fifo3 = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 1, !dbg !385
  %4 = load %class.Fifo*, %class.Fifo** %fifo3, align 8, !dbg !385
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.5, i32 0, i32 0), %class.Echo* %this1, i64 96, %class.Fifo* %4, i64 96), !dbg !387
  ret void, !dbg !388
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTest5driveC2EPS_(%"class.EchoTest::drive"* %this, %class.EchoTest* %module) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.EchoTest::drive"*, align 8
  %module.addr = alloca %class.EchoTest*, align 8
  store %"class.EchoTest::drive"* %this, %"class.EchoTest::drive"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.EchoTest::drive"** %this.addr, metadata !389, metadata !317), !dbg !391
  store %class.EchoTest* %module, %class.EchoTest** %module.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %module.addr, metadata !392, metadata !317), !dbg !393
  %this1 = load %"class.EchoTest::drive"*, %"class.EchoTest::drive"** %this.addr
  %0 = bitcast %"class.EchoTest::drive"* %this1 to %class.Rule*, !dbg !393
  call void @_ZN4RuleC2Ev(%class.Rule* %0) #3, !dbg !393
  %1 = bitcast %"class.EchoTest::drive"* %this1 to i32 (...)***, !dbg !393
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTVN8EchoTest5driveE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !393
  %module2 = getelementptr inbounds %"class.EchoTest::drive", %"class.EchoTest::drive"* %this1, i32 0, i32 1, !dbg !393
  %2 = load %class.EchoTest*, %class.EchoTest** %module.addr, align 8, !dbg !393
  store %class.EchoTest* %2, %class.EchoTest** %module2, align 8, !dbg !393
  %3 = load %class.EchoTest*, %class.EchoTest** %module.addr, align 8, !dbg !394
  %4 = bitcast %class.EchoTest* %3 to %class.Module*, !dbg !394
  %5 = bitcast %"class.EchoTest::drive"* %this1 to %class.Rule*, !dbg !394
  call void @_ZN6Module7addRuleEP4Rule(%class.Module* %4, %class.Rule* %5), !dbg !394
  ret void, !dbg !393
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiEC2Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !396, metadata !317), !dbg !398
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to %class.Fifo*, !dbg !399
  call void @_ZN4FifoIiEC2Em(%class.Fifo* %0, i64 40), !dbg !400
  %1 = bitcast %class.Fifo1* %this1 to i32 (...)***, !dbg !399
  store i32 (...)** bitcast (i8** getelementptr inbounds ([12 x i8*], [12 x i8*]* @_ZTV5Fifo1IiE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !399
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !401
  store i8 0, i8* %full, align 1, !dbg !401
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i32 0, i32 0), %class.Fifo1* %this1, i64 40), !dbg !402
  ret void, !dbg !404
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4Echo7respondC2EPS_(%"class.Echo::respond"* %this, %class.Echo* %module) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.Echo::respond"*, align 8
  %module.addr = alloca %class.Echo*, align 8
  store %"class.Echo::respond"* %this, %"class.Echo::respond"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.Echo::respond"** %this.addr, metadata !405, metadata !317), !dbg !407
  store %class.Echo* %module, %class.Echo** %module.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Echo** %module.addr, metadata !408, metadata !317), !dbg !409
  %this1 = load %"class.Echo::respond"*, %"class.Echo::respond"** %this.addr
  %respond1Rule = getelementptr inbounds %"class.Echo::respond", %"class.Echo::respond"* %this1, i32 0, i32 0, !dbg !409
  %0 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !409
  call void @_ZN4Echo7respond8respond1C2EPS_(%"class.Echo::respond::respond1"* %respond1Rule, %class.Echo* %0), !dbg !409
  %respond2Rule = getelementptr inbounds %"class.Echo::respond", %"class.Echo::respond"* %this1, i32 0, i32 1, !dbg !409
  %1 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !409
  call void @_ZN4Echo7respond8respond2C2EPS_(%"class.Echo::respond::respond2"* %respond2Rule, %class.Echo* %1), !dbg !409
  ret void, !dbg !409
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiEC2Em(%class.Fifo* %this, i64 %size) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  %size.addr = alloca i64, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !410, metadata !317), !dbg !411
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !412, metadata !317), !dbg !413
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i8*, !dbg !414
  %1 = getelementptr inbounds i8, i8* %0, i64 8, !dbg !414
  %2 = bitcast i8* %1 to %class.Module*, !dbg !414
  %3 = load i64, i64* %size.addr, align 8, !dbg !415
  call void @_ZN6ModuleC2Em(%class.Module* %2, i64 %3), !dbg !416
  %4 = bitcast %class.Fifo* %this1 to i32 (...)***, !dbg !414
  store i32 (...)** bitcast (i8** getelementptr inbounds ([12 x i8*], [12 x i8*]* @_ZTV4FifoIiE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %4, !dbg !414
  ret void, !dbg !417
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiED2Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !418, metadata !317), !dbg !419
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to %class.Fifo*, !dbg !420
  call void @_ZN4FifoIiED2Ev(%class.Fifo* %0) #3, !dbg !420
  ret void, !dbg !422
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiED0Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !423, metadata !317), !dbg !424
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  call void @_ZN5Fifo1IiED2Ev(%class.Fifo1* %this1) #3, !dbg !425
  %0 = bitcast %class.Fifo1* %this1 to i8*, !dbg !425
  call void @_ZdlPv(i8* %0) #8, !dbg !425
  ret void, !dbg !426
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE8enq__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !427, metadata !317), !dbg !428
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !429
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !429
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 9, !dbg !429
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !429
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !429
  ret i1 %call, !dbg !429
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiE3enqEi(%class.Fifo1* %this, i32 %v) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  %v.addr = alloca i32, align 4
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !430, metadata !317), !dbg !431
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !432, metadata !317), !dbg !433
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = load i32, i32* %v.addr, align 4, !dbg !434
  %element = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 1, !dbg !435
  store i32 %0, i32* %element, align 4, !dbg !436
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !437
  store i8 1, i8* %full, align 1, !dbg !438
  ret void, !dbg !439
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE8deq__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !440, metadata !317), !dbg !441
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !442
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !442
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 8, !dbg !442
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !442
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !442
  ret i1 %call, !dbg !442
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiE3deqEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !443, metadata !317), !dbg !444
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !445
  store i8 0, i8* %full, align 1, !dbg !446
  ret void, !dbg !447
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE10first__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !448, metadata !317), !dbg !449
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !450
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !450
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 8, !dbg !450
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !450
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !450
  ret i1 %call, !dbg !450
}

; Function Attrs: nounwind
define linkonce_odr i32 @_ZN5Fifo1IiE5firstEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !451, metadata !317), !dbg !452
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %element = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 1, !dbg !453
  %0 = load i32, i32* %element, align 4, !dbg !453
  ret i32 %0, !dbg !454
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZNK5Fifo1IiE8notEmptyEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !455, metadata !317), !dbg !457
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !458
  %0 = load i8, i8* %full, align 1, !dbg !458
  %tobool = trunc i8 %0 to i1, !dbg !458
  ret i1 %tobool, !dbg !459
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZNK5Fifo1IiE7notFullEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !460, metadata !317), !dbg !461
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !462
  %0 = load i8, i8* %full, align 1, !dbg !462
  %tobool = trunc i8 %0 to i1, !dbg !462
  %lnot = xor i1 %tobool, true, !dbg !463
  ret i1 %lnot, !dbg !464
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiED2Ev(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !465, metadata !317), !dbg !466
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  ret void, !dbg !467
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiED0Ev(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !468, metadata !317), !dbg !469
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  call void @_ZN4FifoIiED2Ev(%class.Fifo* %this1) #3, !dbg !470
  %0 = bitcast %class.Fifo* %this1 to i8*, !dbg !470
  call void @_ZdlPv(i8* %0) #8, !dbg !470
  ret void, !dbg !471
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE8enq__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !472, metadata !317), !dbg !473
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !474
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !474
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 9, !dbg !474
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !474
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !474
  ret i1 %call, !dbg !474
}

declare void @__cxa_pure_virtual()

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE8deq__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !475, metadata !317), !dbg !476
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !477
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !477
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 8, !dbg !477
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !477
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !477
  ret i1 %call, !dbg !477
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE10first__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !478, metadata !317), !dbg !479
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !480
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !480
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 8, !dbg !480
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !480
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !480
  ret i1 %call, !dbg !480
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #5

; Function Attrs: nounwind
define linkonce_odr void @_ZN4Echo7respond8respond1C2EPS_(%"class.Echo::respond::respond1"* %this, %class.Echo* %module) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.Echo::respond::respond1"*, align 8
  %module.addr = alloca %class.Echo*, align 8
  store %"class.Echo::respond::respond1"* %this, %"class.Echo::respond::respond1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.Echo::respond::respond1"** %this.addr, metadata !481, metadata !317), !dbg !483
  store %class.Echo* %module, %class.Echo** %module.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Echo** %module.addr, metadata !484, metadata !317), !dbg !485
  %this1 = load %"class.Echo::respond::respond1"*, %"class.Echo::respond::respond1"** %this.addr
  %0 = bitcast %"class.Echo::respond::respond1"* %this1 to %class.Rule*, !dbg !485
  call void @_ZN4RuleC2Ev(%class.Rule* %0) #3, !dbg !485
  %1 = bitcast %"class.Echo::respond::respond1"* %this1 to i32 (...)***, !dbg !485
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTVN4Echo7respond8respond1E, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !485
  %module2 = getelementptr inbounds %"class.Echo::respond::respond1", %"class.Echo::respond::respond1"* %this1, i32 0, i32 1, !dbg !485
  %2 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !485
  store %class.Echo* %2, %class.Echo** %module2, align 8, !dbg !485
  %3 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !486
  %4 = bitcast %class.Echo* %3 to %class.Module*, !dbg !486
  %5 = bitcast %"class.Echo::respond::respond1"* %this1 to %class.Rule*, !dbg !486
  call void @_ZN6Module7addRuleEP4Rule(%class.Module* %4, %class.Rule* %5), !dbg !486
  ret void, !dbg !485
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4Echo7respond8respond2C2EPS_(%"class.Echo::respond::respond2"* %this, %class.Echo* %module) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.Echo::respond::respond2"*, align 8
  %module.addr = alloca %class.Echo*, align 8
  store %"class.Echo::respond::respond2"* %this, %"class.Echo::respond::respond2"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.Echo::respond::respond2"** %this.addr, metadata !488, metadata !317), !dbg !490
  store %class.Echo* %module, %class.Echo** %module.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Echo** %module.addr, metadata !491, metadata !317), !dbg !492
  %this1 = load %"class.Echo::respond::respond2"*, %"class.Echo::respond::respond2"** %this.addr
  %0 = bitcast %"class.Echo::respond::respond2"* %this1 to %class.Rule*, !dbg !492
  call void @_ZN4RuleC2Ev(%class.Rule* %0) #3, !dbg !492
  %1 = bitcast %"class.Echo::respond::respond2"* %this1 to i32 (...)***, !dbg !492
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTVN4Echo7respond8respond2E, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !492
  %module2 = getelementptr inbounds %"class.Echo::respond::respond2", %"class.Echo::respond::respond2"* %this1, i32 0, i32 1, !dbg !492
  %2 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !492
  store %class.Echo* %2, %class.Echo** %module2, align 8, !dbg !492
  %3 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !493
  %4 = bitcast %class.Echo* %3 to %class.Module*, !dbg !493
  %5 = bitcast %"class.Echo::respond::respond2"* %this1 to %class.Rule*, !dbg !493
  call void @_ZN6Module7addRuleEP4Rule(%class.Module* %4, %class.Rule* %5), !dbg !493
  ret void, !dbg !492
}

; Function Attrs: inlinehint nounwind
define linkonce_odr void @_ZN4RuleC2Ev(%class.Rule* %this) unnamed_addr #6 comdat align 2 {
entry:
  %this.addr = alloca %class.Rule*, align 8
  store %class.Rule* %this, %class.Rule** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Rule** %this.addr, metadata !495, metadata !317), !dbg !496
  %this1 = load %class.Rule*, %class.Rule** %this.addr
  %0 = bitcast %class.Rule* %this1 to i32 (...)***, !dbg !497
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTV4Rule, i64 0, i64 2) to i32 (...)**), i32 (...)*** %0, !dbg !497
  ret void, !dbg !497
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN6Module7addRuleEP4Rule(%class.Module* %this, %class.Rule* %rule) #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Module*, align 8
  %rule.addr = alloca %class.Rule*, align 8
  store %class.Module* %this, %class.Module** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Module** %this.addr, metadata !498, metadata !317), !dbg !499
  store %class.Rule* %rule, %class.Rule** %rule.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Rule** %rule.addr, metadata !500, metadata !317), !dbg !501
  %this1 = load %class.Module*, %class.Module** %this.addr
  %rfirst = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !502
  %rfirst2 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !503
  %0 = load %class.Rule*, %class.Rule** %rfirst2, align 8, !dbg !503
  %1 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !504
  %2 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !505
  %next = getelementptr inbounds %class.Rule, %class.Rule* %2, i32 0, i32 1, !dbg !506
  %3 = bitcast %class.Rule** %next to i8**, !dbg !507
  %add.ptr = getelementptr inbounds i8*, i8** %3, i64 -1, !dbg !508
  %4 = load i8*, i8** %add.ptr, align 8, !dbg !509
  %5 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !510
  %next3 = getelementptr inbounds %class.Rule, %class.Rule* %5, i32 0, i32 1, !dbg !511
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__FUNCTION__._ZN6Module7addRuleEP4Rule, i32 0, i32 0), %class.Rule** %rfirst, %class.Rule* %0, %class.Module* %this1, %class.Rule* %1, i8* %4, %class.Rule** %next3), !dbg !512
  %rfirst4 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !513
  %6 = load %class.Rule*, %class.Rule** %rfirst4, align 8, !dbg !513
  %7 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !514
  %next5 = getelementptr inbounds %class.Rule, %class.Rule* %7, i32 0, i32 1, !dbg !515
  store %class.Rule* %6, %class.Rule** %next5, align 8, !dbg !516
  %8 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !517
  %rfirst6 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !518
  store %class.Rule* %8, %class.Rule** %rfirst6, align 8, !dbg !519
  ret void, !dbg !520
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4Echo7respond8respond13RDYEv(%"class.Echo::respond::respond1"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.Echo::respond::respond1"*, align 8
  store %"class.Echo::respond::respond1"* %this, %"class.Echo::respond::respond1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.Echo::respond::respond1"** %this.addr, metadata !521, metadata !317), !dbg !522
  %this1 = load %"class.Echo::respond::respond1"*, %"class.Echo::respond::respond1"** %this.addr
  ret i1 true, !dbg !523
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4Echo7respond8respond13ENAEv(%"class.Echo::respond::respond1"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.Echo::respond::respond1"*, align 8
  store %"class.Echo::respond::respond1"* %this, %"class.Echo::respond::respond1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.Echo::respond::respond1"** %this.addr, metadata !524, metadata !317), !dbg !525
  %this1 = load %"class.Echo::respond::respond1"*, %"class.Echo::respond::respond1"** %this.addr
  %module = getelementptr inbounds %"class.Echo::respond::respond1", %"class.Echo::respond::respond1"* %this1, i32 0, i32 1, !dbg !526
  %0 = load %class.Echo*, %class.Echo** %module, align 8, !dbg !526
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %0, i32 0, i32 1, !dbg !526
  %1 = load %class.Fifo*, %class.Fifo** %fifo, align 8, !dbg !526
  %2 = bitcast %class.Fifo* %1 to void (%class.Fifo*)***, !dbg !526
  %vtable = load void (%class.Fifo*)**, void (%class.Fifo*)*** %2, !dbg !526
  %vfn = getelementptr inbounds void (%class.Fifo*)*, void (%class.Fifo*)** %vtable, i64 5, !dbg !526
  %3 = load void (%class.Fifo*)*, void (%class.Fifo*)** %vfn, !dbg !526
  call void %3(%class.Fifo* %1), !dbg !526
  %module2 = getelementptr inbounds %"class.Echo::respond::respond1", %"class.Echo::respond::respond1"* %this1, i32 0, i32 1, !dbg !526
  %4 = load %class.Echo*, %class.Echo** %module2, align 8, !dbg !526
  %ind = getelementptr inbounds %class.Echo, %class.Echo* %4, i32 0, i32 2, !dbg !526
  %5 = load %class.EchoIndication*, %class.EchoIndication** %ind, align 8, !dbg !526
  %module3 = getelementptr inbounds %"class.Echo::respond::respond1", %"class.Echo::respond::respond1"* %this1, i32 0, i32 1, !dbg !526
  %6 = load %class.Echo*, %class.Echo** %module3, align 8, !dbg !526
  %fifo4 = getelementptr inbounds %class.Echo, %class.Echo* %6, i32 0, i32 1, !dbg !526
  %7 = load %class.Fifo*, %class.Fifo** %fifo4, align 8, !dbg !526
  %8 = bitcast %class.Fifo* %7 to i32 (%class.Fifo*)***, !dbg !526
  %vtable5 = load i32 (%class.Fifo*)**, i32 (%class.Fifo*)*** %8, !dbg !526
  %vfn6 = getelementptr inbounds i32 (%class.Fifo*)*, i32 (%class.Fifo*)** %vtable5, i64 7, !dbg !526
  %9 = load i32 (%class.Fifo*)*, i32 (%class.Fifo*)** %vfn6, !dbg !526
  %call = call i32 %9(%class.Fifo* %7), !dbg !526
  call void @_ZN14EchoIndication4echoEi(i32 %call), !dbg !526
  ret void, !dbg !526
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4Echo7respond8respond23RDYEv(%"class.Echo::respond::respond2"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.Echo::respond::respond2"*, align 8
  store %"class.Echo::respond::respond2"* %this, %"class.Echo::respond::respond2"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.Echo::respond::respond2"** %this.addr, metadata !527, metadata !317), !dbg !528
  %this1 = load %"class.Echo::respond::respond2"*, %"class.Echo::respond::respond2"** %this.addr
  ret i1 true, !dbg !529
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4Echo7respond8respond23ENAEv(%"class.Echo::respond::respond2"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.Echo::respond::respond2"*, align 8
  store %"class.Echo::respond::respond2"* %this, %"class.Echo::respond::respond2"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.Echo::respond::respond2"** %this.addr, metadata !530, metadata !317), !dbg !531
  %this1 = load %"class.Echo::respond::respond2"*, %"class.Echo::respond::respond2"** %this.addr
  ret void, !dbg !532
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN8EchoTest5drive3RDYEv(%"class.EchoTest::drive"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.EchoTest::drive"*, align 8
  store %"class.EchoTest::drive"* %this, %"class.EchoTest::drive"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.EchoTest::drive"** %this.addr, metadata !533, metadata !317), !dbg !534
  %this1 = load %"class.EchoTest::drive"*, %"class.EchoTest::drive"** %this.addr
  ret i1 true, !dbg !535
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTest5drive3ENAEv(%"class.EchoTest::drive"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.EchoTest::drive"*, align 8
  store %"class.EchoTest::drive"* %this, %"class.EchoTest::drive"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.EchoTest::drive"** %this.addr, metadata !536, metadata !317), !dbg !537
  %this1 = load %"class.EchoTest::drive"*, %"class.EchoTest::drive"** %this.addr
  %module = getelementptr inbounds %"class.EchoTest::drive", %"class.EchoTest::drive"* %this1, i32 0, i32 1, !dbg !538
  %0 = load %class.EchoTest*, %class.EchoTest** %module, align 8, !dbg !538
  %echo = getelementptr inbounds %class.EchoTest, %class.EchoTest* %0, i32 0, i32 1, !dbg !538
  %1 = load %class.Echo*, %class.Echo** %echo, align 8, !dbg !538
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %1, i32 0, i32 1, !dbg !538
  %2 = load %class.Fifo*, %class.Fifo** %fifo, align 8, !dbg !538
  %3 = bitcast %class.Fifo* %2 to void (%class.Fifo*, i32)***, !dbg !538
  %vtable = load void (%class.Fifo*, i32)**, void (%class.Fifo*, i32)*** %3, !dbg !538
  %vfn = getelementptr inbounds void (%class.Fifo*, i32)*, void (%class.Fifo*, i32)** %vtable, i64 3, !dbg !538
  %4 = load void (%class.Fifo*, i32)*, void (%class.Fifo*, i32)** %vfn, !dbg !538
  call void %4(%class.Fifo* %2, i32 22), !dbg !538
  ret void, !dbg !538
}

; Function Attrs: nounwind
define internal void @_GLOBAL__sub_I_echo.cpp() #0 section ".text.startup" {
entry:
  call void @__cxx_global_var_init(), !dbg !539
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nobuiltin "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { inlinehint nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { builtin }
attributes #8 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!313, !314}
!llvm.ident = !{!315}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !249, globals: !299, imports: !301)
!1 = !DIFile(filename: "echo.cpp", directory: "/home/jca/s/git/atomicc/examples/echo")
!2 = !{}
!3 = !{!4, !59, !60, !71, !83, !105, !120, !136, !168, !176, !190, !204, !219, !220, !248}
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !6, file: !5, line: 75, size: 64, align: 64, elements: !9, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/exception_ptr.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!6 = !DINamespace(name: "__exception_ptr", scope: !7, file: !5, line: 53)
!7 = !DINamespace(name: "std", scope: null, file: !8, line: 184)
!8 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/c++config.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!9 = !{!10, !12, !16, !19, !20, !25, !26, !30, !35, !39, !43, !46, !47, !50, !54}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 77, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!12 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 79, type: !13, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15, !11}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!16 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 81, type: !17, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPrototyped, isOptimized: false)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !15}
!19 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 82, type: !17, isLocal: false, isDefinition: false, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: false)
!20 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 84, type: !21, isLocal: false, isDefinition: false, scopeLine: 84, flags: DIFlagPrototyped, isOptimized: false)
!21 = !DISubroutineType(types: !22)
!22 = !{!11, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE")
!25 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 90, type: !17, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!26 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 92, type: !27, isLocal: false, isDefinition: false, scopeLine: 92, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !15, !29}
!29 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !24)
!30 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 95, type: !31, isLocal: false, isDefinition: false, scopeLine: 95, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !15, !33}
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !7, file: !8, line: 190, baseType: !34)
!34 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!35 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 99, type: !36, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !15, !38}
!38 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE")
!39 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 112, type: !40, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !15, !29}
!42 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE")
!43 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 116, type: !44, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!44 = !DISubroutineType(types: !45)
!45 = !{!42, !15, !38}
!46 = !DISubprogram(name: "~exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 123, type: !17, isLocal: false, isDefinition: false, scopeLine: 123, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!47 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 126, type: !48, isLocal: false, isDefinition: false, scopeLine: 126, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !15, !42}
!50 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 138, type: !51, isLocal: false, isDefinition: false, scopeLine: 138, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !23}
!53 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!54 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 147, type: !55, isLocal: false, isDefinition: false, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !23}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64, align: 64)
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTSSt9type_info")
!59 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !7, file: !5, line: 47, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!60 = !DICompositeType(tag: DW_TAG_class_type, name: "EchoIndication", file: !1, line: 32, size: 8, align: 8, elements: !61, identifier: "_ZTS14EchoIndication")
!61 = !{!62, !66, !70}
!62 = !DISubprogram(name: "echo", linkageName: "_ZN14EchoIndication4echoEi", scope: !"_ZTS14EchoIndication", file: !1, line: 34, type: !63, isLocal: false, isDefinition: false, scopeLine: 34, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !65}
!65 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!66 = !DISubprogram(name: "EchoIndication", scope: !"_ZTS14EchoIndication", file: !1, line: 35, type: !67, isLocal: false, isDefinition: false, scopeLine: 35, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!67 = !DISubroutineType(types: !68)
!68 = !{null, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS14EchoIndication", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!70 = !DISubprogram(name: "~EchoIndication", scope: !"_ZTS14EchoIndication", file: !1, line: 36, type: !67, isLocal: false, isDefinition: false, scopeLine: 36, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!71 = !DICompositeType(tag: DW_TAG_class_type, name: "EchoTest", file: !1, line: 67, size: 512, align: 64, elements: !72, identifier: "_ZTS8EchoTest")
!72 = !{!73, !74, !76, !77, !78, !82}
!73 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS8EchoTest", baseType: !"_ZTS6Module", flags: DIFlagPublic)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !"_ZTS8EchoTest", file: !1, line: 69, baseType: !75, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Echo", size: 64, align: 64)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !"_ZTS8EchoTest", file: !1, line: 70, baseType: !65, size: 32, align: 32, offset: 256, flags: DIFlagPublic)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "driveRule", scope: !"_ZTS8EchoTest", file: !1, line: 71, baseType: !"_ZTSN8EchoTest5driveE", size: 192, align: 64, offset: 320, flags: DIFlagPublic)
!78 = !DISubprogram(name: "EchoTest", scope: !"_ZTS8EchoTest", file: !1, line: 76, type: !79, isLocal: false, isDefinition: false, scopeLine: 76, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{null, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS8EchoTest", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!82 = !DISubprogram(name: "~EchoTest", scope: !"_ZTS8EchoTest", file: !1, line: 79, type: !79, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!83 = !DICompositeType(tag: DW_TAG_class_type, name: "Module", file: !84, line: 51, size: 192, align: 64, elements: !85, identifier: "_ZTS6Module")
!84 = !DIFile(filename: "../../cpp/atomicc.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!85 = !{!86, !88, !90, !94, !95, !99, !102}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "rfirst", scope: !"_ZTS6Module", file: !84, line: 77, baseType: !87, size: 64, align: 64, flags: DIFlagPublic)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Rule", size: 64, align: 64)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !"_ZTS6Module", file: !84, line: 78, baseType: !89, size: 64, align: 64, offset: 64, flags: DIFlagPublic)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !"_ZTS6Module", file: !84, line: 80, baseType: !91, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !92, line: 62, baseType: !93)
!92 = !DIFile(filename: "/scratch/jca/git/llvm/build/Debug+Asserts/bin/../lib/clang/3.7.0/include/stddef.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!93 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "first", scope: !"_ZTS6Module", file: !84, line: 81, baseType: !89, flags: DIFlagPublic | DIFlagStaticMember)
!95 = !DISubprogram(name: "Module", scope: !"_ZTS6Module", file: !84, line: 54, type: !96, isLocal: false, isDefinition: false, scopeLine: 54, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!96 = !DISubroutineType(types: !97)
!97 = !{null, !98, !91}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!99 = !DISubprogram(name: "addRule", linkageName: "_ZN6Module7addRuleEP4Rule", scope: !"_ZTS6Module", file: !84, line: 61, type: !100, isLocal: false, isDefinition: false, scopeLine: 61, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!100 = !DISubroutineType(types: !101)
!101 = !{null, !98, !87}
!102 = !DISubprogram(name: "run", linkageName: "_ZN6Module3runEv", scope: !"_ZTS6Module", file: !84, line: 66, type: !103, isLocal: false, isDefinition: false, scopeLine: 66, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!103 = !DISubroutineType(types: !104)
!104 = !{null, !98}
!105 = !DICompositeType(tag: DW_TAG_class_type, name: "Rule", file: !84, line: 37, size: 128, align: 64, elements: !106, vtableHolder: !"_ZTS4Rule", identifier: "_ZTS4Rule")
!106 = !{!107, !112, !113, !117}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$Rule", scope: !84, file: !84, baseType: !108, size: 64, flags: DIFlagArtificial)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !110, size: 64)
!110 = !DISubroutineType(types: !111)
!111 = !{!65}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !"_ZTS4Rule", file: !84, line: 41, baseType: !87, size: 64, align: 64, offset: 64, flags: DIFlagPublic)
!113 = !DISubprogram(name: "RDY", linkageName: "_ZN4Rule3RDYEv", scope: !"_ZTS4Rule", file: !84, line: 39, type: !114, isLocal: false, isDefinition: false, scopeLine: 39, containingType: !"_ZTS4Rule", virtuality: DW_VIRTUALITY_pure_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!114 = !DISubroutineType(types: !115)
!115 = !{!53, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Rule", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!117 = !DISubprogram(name: "ENA", linkageName: "_ZN4Rule3ENAEv", scope: !"_ZTS4Rule", file: !84, line: 40, type: !118, isLocal: false, isDefinition: false, scopeLine: 40, containingType: !"_ZTS4Rule", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{null, !116}
!120 = !DICompositeType(tag: DW_TAG_class_type, name: "Echo", file: !1, line: 39, size: 768, align: 64, elements: !121, identifier: "_ZTS4Echo")
!121 = !{!122, !123, !125, !127, !128, !129, !133}
!122 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS4Echo", baseType: !"_ZTS6Module", flags: DIFlagPublic)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "fifo", scope: !"_ZTS4Echo", file: !1, line: 41, baseType: !124, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4FifoIiE", size: 64, align: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "ind", scope: !"_ZTS4Echo", file: !1, line: 42, baseType: !126, size: 64, align: 64, offset: 256, flags: DIFlagPublic)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS14EchoIndication", size: 64, align: 64)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "pipetemp", scope: !"_ZTS4Echo", file: !1, line: 43, baseType: !65, size: 32, align: 32, offset: 320, flags: DIFlagPublic)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "respondRule", scope: !"_ZTS4Echo", file: !1, line: 44, baseType: !"_ZTSN4Echo7respondE", size: 384, align: 64, offset: 384, flags: DIFlagPublic)
!129 = !DISubprogram(name: "Echo", scope: !"_ZTS4Echo", file: !1, line: 51, type: !130, isLocal: false, isDefinition: false, scopeLine: 51, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!130 = !DISubroutineType(types: !131)
!131 = !{null, !132, !126}
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Echo", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!133 = !DISubprogram(name: "~Echo", scope: !"_ZTS4Echo", file: !1, line: 54, type: !134, isLocal: false, isDefinition: false, scopeLine: 54, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{null, !132}
!136 = !DICompositeType(tag: DW_TAG_class_type, name: "Fifo<int>", file: !137, line: 8, size: 256, align: 64, elements: !138, vtableHolder: !"_ZTS4FifoIiE", templateParams: !166, identifier: "_ZTS4FifoIiE")
!137 = !DIFile(filename: "../../cpp/fifo.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!138 = !{!139, !140, !141, !145, !148, !151, !154, !155, !156, !157, !160, !165}
!139 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS4FifoIiE", baseType: !"_ZTS6Module", offset: 64, flags: DIFlagPublic)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$Fifo", scope: !137, file: !137, baseType: !108, size: 64, flags: DIFlagArtificial)
!141 = !DISubprogram(name: "Fifo", scope: !"_ZTS4FifoIiE", file: !137, line: 10, type: !142, isLocal: false, isDefinition: false, scopeLine: 10, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{null, !144, !91}
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4FifoIiE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!145 = !DISubprogram(name: "~Fifo", scope: !"_ZTS4FifoIiE", file: !137, line: 11, type: !146, isLocal: false, isDefinition: false, scopeLine: 11, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{null, !144}
!148 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN4FifoIiE8enq__RDYEv", scope: !"_ZTS4FifoIiE", file: !137, line: 12, type: !149, isLocal: false, isDefinition: false, scopeLine: 12, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!149 = !DISubroutineType(types: !150)
!150 = !{!53, !144}
!151 = !DISubprogram(name: "enq", linkageName: "_ZN4FifoIiE3enqEi", scope: !"_ZTS4FifoIiE", file: !137, line: 12, type: !152, isLocal: false, isDefinition: false, scopeLine: 12, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 3, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!152 = !DISubroutineType(types: !153)
!153 = !{null, !144, !65}
!154 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN4FifoIiE8deq__RDYEv", scope: !"_ZTS4FifoIiE", file: !137, line: 13, type: !149, isLocal: false, isDefinition: false, scopeLine: 13, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 4, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!155 = !DISubprogram(name: "deq", linkageName: "_ZN4FifoIiE3deqEv", scope: !"_ZTS4FifoIiE", file: !137, line: 13, type: !146, isLocal: false, isDefinition: false, scopeLine: 13, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 5, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!156 = !DISubprogram(name: "first__RDY", linkageName: "_ZN4FifoIiE10first__RDYEv", scope: !"_ZTS4FifoIiE", file: !137, line: 14, type: !149, isLocal: false, isDefinition: false, scopeLine: 14, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!157 = !DISubprogram(name: "first", linkageName: "_ZN4FifoIiE5firstEv", scope: !"_ZTS4FifoIiE", file: !137, line: 14, type: !158, isLocal: false, isDefinition: false, scopeLine: 14, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 7, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!158 = !DISubroutineType(types: !159)
!159 = !{!65, !144}
!160 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK4FifoIiE8notEmptyEv", scope: !"_ZTS4FifoIiE", file: !137, line: 15, type: !161, isLocal: false, isDefinition: false, scopeLine: 15, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 8, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!53, !163}
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!164 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTS4FifoIiE")
!165 = !DISubprogram(name: "notFull", linkageName: "_ZNK4FifoIiE7notFullEv", scope: !"_ZTS4FifoIiE", file: !137, line: 16, type: !161, isLocal: false, isDefinition: false, scopeLine: 16, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 9, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!166 = !{!167}
!167 = !DITemplateTypeParameter(name: "T", type: !65)
!168 = !DICompositeType(tag: DW_TAG_class_type, name: "respond", scope: !"_ZTS4Echo", file: !1, line: 44, size: 384, align: 64, elements: !169, identifier: "_ZTSN4Echo7respondE")
!169 = !{!170, !171, !172}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "respond1Rule", scope: !"_ZTSN4Echo7respondE", file: !1, line: 44, baseType: !"_ZTSN4Echo7respond8respond1E", size: 192, align: 64, flags: DIFlagPublic)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "respond2Rule", scope: !"_ZTSN4Echo7respondE", file: !1, line: 44, baseType: !"_ZTSN4Echo7respond8respond2E", size: 192, align: 64, offset: 192, flags: DIFlagPublic)
!172 = !DISubprogram(name: "respond", scope: !"_ZTSN4Echo7respondE", file: !1, line: 44, type: !173, isLocal: false, isDefinition: false, scopeLine: 44, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{null, !175, !75}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN4Echo7respondE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!176 = !DICompositeType(tag: DW_TAG_class_type, name: "respond1", scope: !"_ZTSN4Echo7respondE", file: !1, line: 44, size: 192, align: 64, elements: !177, vtableHolder: !"_ZTS4Rule", identifier: "_ZTSN4Echo7respond8respond1E")
!177 = !{!178, !179, !180, !184, !187}
!178 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTSN4Echo7respond8respond1E", baseType: !"_ZTS4Rule", flags: DIFlagPublic)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "module", scope: !"_ZTSN4Echo7respond8respond1E", file: !1, line: 44, baseType: !75, size: 64, align: 64, offset: 128)
!180 = !DISubprogram(name: "RDY", linkageName: "_ZN4Echo7respond8respond13RDYEv", scope: !"_ZTSN4Echo7respond8respond1E", file: !1, line: 44, type: !181, isLocal: false, isDefinition: false, scopeLine: 44, containingType: !"_ZTSN4Echo7respond8respond1E", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!53, !183}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN4Echo7respond8respond1E", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!184 = !DISubprogram(name: "ENA", linkageName: "_ZN4Echo7respond8respond13ENAEv", scope: !"_ZTSN4Echo7respond8respond1E", file: !1, line: 44, type: !185, isLocal: false, isDefinition: false, scopeLine: 44, containingType: !"_ZTSN4Echo7respond8respond1E", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!185 = !DISubroutineType(types: !186)
!186 = !{null, !183}
!187 = !DISubprogram(name: "respond1", scope: !"_ZTSN4Echo7respond8respond1E", file: !1, line: 44, type: !188, isLocal: false, isDefinition: false, scopeLine: 44, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!188 = !DISubroutineType(types: !189)
!189 = !{null, !183, !75}
!190 = !DICompositeType(tag: DW_TAG_class_type, name: "respond2", scope: !"_ZTSN4Echo7respondE", file: !1, line: 44, size: 192, align: 64, elements: !191, vtableHolder: !"_ZTS4Rule", identifier: "_ZTSN4Echo7respond8respond2E")
!191 = !{!192, !193, !194, !198, !201}
!192 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTSN4Echo7respond8respond2E", baseType: !"_ZTS4Rule", flags: DIFlagPublic)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "module", scope: !"_ZTSN4Echo7respond8respond2E", file: !1, line: 44, baseType: !75, size: 64, align: 64, offset: 128)
!194 = !DISubprogram(name: "RDY", linkageName: "_ZN4Echo7respond8respond23RDYEv", scope: !"_ZTSN4Echo7respond8respond2E", file: !1, line: 44, type: !195, isLocal: false, isDefinition: false, scopeLine: 44, containingType: !"_ZTSN4Echo7respond8respond2E", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{!53, !197}
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN4Echo7respond8respond2E", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!198 = !DISubprogram(name: "ENA", linkageName: "_ZN4Echo7respond8respond23ENAEv", scope: !"_ZTSN4Echo7respond8respond2E", file: !1, line: 44, type: !199, isLocal: false, isDefinition: false, scopeLine: 44, containingType: !"_ZTSN4Echo7respond8respond2E", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!199 = !DISubroutineType(types: !200)
!200 = !{null, !197}
!201 = !DISubprogram(name: "respond2", scope: !"_ZTSN4Echo7respond8respond2E", file: !1, line: 44, type: !202, isLocal: false, isDefinition: false, scopeLine: 44, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!202 = !DISubroutineType(types: !203)
!203 = !{null, !197, !75}
!204 = !DICompositeType(tag: DW_TAG_class_type, name: "drive", scope: !"_ZTS8EchoTest", file: !1, line: 71, size: 192, align: 64, elements: !205, vtableHolder: !"_ZTS4Rule", identifier: "_ZTSN8EchoTest5driveE")
!205 = !{!206, !207, !209, !213, !216}
!206 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTSN8EchoTest5driveE", baseType: !"_ZTS4Rule", flags: DIFlagPublic)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "module", scope: !"_ZTSN8EchoTest5driveE", file: !1, line: 71, baseType: !208, size: 64, align: 64, offset: 128)
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS8EchoTest", size: 64, align: 64)
!209 = !DISubprogram(name: "RDY", linkageName: "_ZN8EchoTest5drive3RDYEv", scope: !"_ZTSN8EchoTest5driveE", file: !1, line: 71, type: !210, isLocal: false, isDefinition: false, scopeLine: 71, containingType: !"_ZTSN8EchoTest5driveE", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!210 = !DISubroutineType(types: !211)
!211 = !{!53, !212}
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN8EchoTest5driveE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!213 = !DISubprogram(name: "ENA", linkageName: "_ZN8EchoTest5drive3ENAEv", scope: !"_ZTSN8EchoTest5driveE", file: !1, line: 71, type: !214, isLocal: false, isDefinition: false, scopeLine: 71, containingType: !"_ZTSN8EchoTest5driveE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!214 = !DISubroutineType(types: !215)
!215 = !{null, !212}
!216 = !DISubprogram(name: "drive", scope: !"_ZTSN8EchoTest5driveE", file: !1, line: 71, type: !217, isLocal: false, isDefinition: false, scopeLine: 71, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!217 = !DISubroutineType(types: !218)
!218 = !{null, !212, !208}
!219 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!220 = !DICompositeType(tag: DW_TAG_class_type, name: "Fifo1<int>", file: !137, line: 20, size: 320, align: 64, elements: !221, vtableHolder: !"_ZTS4FifoIiE", templateParams: !166, identifier: "_ZTS5Fifo1IiE")
!221 = !{!222, !223, !224, !225, !229, !232, !233, !236, !237, !240, !241, !242, !247}
!222 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS5Fifo1IiE", baseType: !"_ZTS4FifoIiE", flags: DIFlagPublic)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "element", scope: !"_ZTS5Fifo1IiE", file: !137, line: 23, baseType: !65, size: 32, align: 32, offset: 256, flags: DIFlagPublic)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "full", scope: !"_ZTS5Fifo1IiE", file: !137, line: 24, baseType: !53, size: 8, align: 8, offset: 288, flags: DIFlagPublic)
!225 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN5Fifo1IiE8enq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 26, type: !226, isLocal: false, isDefinition: false, scopeLine: 26, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!226 = !DISubroutineType(types: !227)
!227 = !{!53, !228}
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS5Fifo1IiE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!229 = !DISubprogram(name: "enq", linkageName: "_ZN5Fifo1IiE3enqEi", scope: !"_ZTS5Fifo1IiE", file: !137, line: 26, type: !230, isLocal: false, isDefinition: false, scopeLine: 26, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 3, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!230 = !DISubroutineType(types: !231)
!231 = !{null, !228, !65}
!232 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN5Fifo1IiE8deq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 30, type: !226, isLocal: false, isDefinition: false, scopeLine: 30, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 4, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!233 = !DISubprogram(name: "deq", linkageName: "_ZN5Fifo1IiE3deqEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 30, type: !234, isLocal: false, isDefinition: false, scopeLine: 30, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 5, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!234 = !DISubroutineType(types: !235)
!235 = !{null, !228}
!236 = !DISubprogram(name: "first__RDY", linkageName: "_ZN5Fifo1IiE10first__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 33, type: !226, isLocal: false, isDefinition: false, scopeLine: 33, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!237 = !DISubprogram(name: "first", linkageName: "_ZN5Fifo1IiE5firstEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 33, type: !238, isLocal: false, isDefinition: false, scopeLine: 33, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 7, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!238 = !DISubroutineType(types: !239)
!239 = !{!65, !228}
!240 = !DISubprogram(name: "Fifo1", scope: !"_ZTS5Fifo1IiE", file: !137, line: 36, type: !234, isLocal: false, isDefinition: false, scopeLine: 36, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!241 = !DISubprogram(name: "~Fifo1", scope: !"_ZTS5Fifo1IiE", file: !137, line: 40, type: !234, isLocal: false, isDefinition: false, scopeLine: 40, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!242 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK5Fifo1IiE8notEmptyEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 41, type: !243, isLocal: false, isDefinition: false, scopeLine: 41, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 8, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!243 = !DISubroutineType(types: !244)
!244 = !{!53, !245}
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!246 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTS5Fifo1IiE")
!247 = !DISubprogram(name: "notFull", linkageName: "_ZNK5Fifo1IiE7notFullEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 42, type: !243, isLocal: false, isDefinition: false, scopeLine: 42, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 9, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!249 = !{!250, !251, !254, !255, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !287, !288, !289, !290, !291, !292, !293, !294, !295, !296, !297}
!250 = !DISubprogram(name: "echo", linkageName: "_ZN14EchoIndication4echoEi", scope: !"_ZTS14EchoIndication", file: !1, line: 61, type: !63, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, function: void (i32)* @_ZN14EchoIndication4echoEi, declaration: !62, variables: !2)
!251 = !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, line: 82, type: !252, isLocal: true, isDefinition: true, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @__cxx_global_var_init, variables: !2)
!252 = !DISubroutineType(types: !253)
!253 = !{null}
!254 = !DISubprogram(name: "__dtor_echoTest", scope: !1, file: !1, line: 82, type: !252, isLocal: true, isDefinition: true, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @__dtor_echoTest, variables: !2)
!255 = !DISubprogram(name: "main", scope: !1, file: !1, line: 84, type: !256, isLocal: false, isDefinition: true, scopeLine: 85, flags: DIFlagPrototyped, isOptimized: false, function: i32 (i32, i8**)* @main, variables: !2)
!256 = !DISubroutineType(types: !257)
!257 = !{!65, !65, !258}
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !259, size: 64, align: 64)
!259 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64, align: 64)
!260 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !261)
!261 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!262 = !DISubprogram(name: "EchoTest", linkageName: "_ZN8EchoTestC2Ev", scope: !"_ZTS8EchoTest", file: !1, line: 76, type: !79, isLocal: false, isDefinition: true, scopeLine: 76, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoTest*)* @_ZN8EchoTestC2Ev, declaration: !78, variables: !2)
!263 = !DISubprogram(name: "Module", linkageName: "_ZN6ModuleC2Em", scope: !"_ZTS6Module", file: !84, line: 54, type: !96, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Module*, i64)* @_ZN6ModuleC2Em, declaration: !95, variables: !2)
!264 = !DISubprogram(name: "EchoIndication", linkageName: "_ZN14EchoIndicationC2Ev", scope: !"_ZTS14EchoIndication", file: !1, line: 35, type: !67, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoIndication*)* @_ZN14EchoIndicationC2Ev, declaration: !66, variables: !2)
!265 = !DISubprogram(name: "Echo", linkageName: "_ZN4EchoC2EP14EchoIndication", scope: !"_ZTS4Echo", file: !1, line: 51, type: !130, isLocal: false, isDefinition: true, scopeLine: 51, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Echo*, %class.EchoIndication*)* @_ZN4EchoC2EP14EchoIndication, declaration: !129, variables: !2)
!266 = !DISubprogram(name: "Fifo1", linkageName: "_ZN5Fifo1IiEC2Ev", scope: !"_ZTS5Fifo1IiE", file: !137, line: 36, type: !234, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiEC2Ev, declaration: !240, variables: !2)
!267 = !DISubprogram(name: "Fifo", linkageName: "_ZN4FifoIiEC2Em", scope: !"_ZTS4FifoIiE", file: !137, line: 10, type: !142, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*, i64)* @_ZN4FifoIiEC2Em, declaration: !141, variables: !2)
!268 = !DISubprogram(name: "~Fifo", linkageName: "_ZN4FifoIiED2Ev", scope: !"_ZTS4FifoIiE", file: !137, line: 11, type: !146, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*)* @_ZN4FifoIiED2Ev, declaration: !145, variables: !2)
!269 = !DISubprogram(name: "~Fifo", linkageName: "_ZN4FifoIiED0Ev", scope: !"_ZTS4FifoIiE", file: !137, line: 11, type: !146, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*)* @_ZN4FifoIiED0Ev, declaration: !145, variables: !2)
!270 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN4FifoIiE8enq__RDYEv", scope: !"_ZTS4FifoIiE", file: !137, line: 12, type: !149, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE8enq__RDYEv, declaration: !148, variables: !2)
!271 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN4FifoIiE8deq__RDYEv", scope: !"_ZTS4FifoIiE", file: !137, line: 13, type: !149, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE8deq__RDYEv, declaration: !154, variables: !2)
!272 = !DISubprogram(name: "first__RDY", linkageName: "_ZN4FifoIiE10first__RDYEv", scope: !"_ZTS4FifoIiE", file: !137, line: 14, type: !149, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE10first__RDYEv, declaration: !156, variables: !2)
!273 = !DISubprogram(name: "~Fifo1", linkageName: "_ZN5Fifo1IiED2Ev", scope: !"_ZTS5Fifo1IiE", file: !137, line: 40, type: !234, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiED2Ev, declaration: !241, variables: !2)
!274 = !DISubprogram(name: "~Fifo1", linkageName: "_ZN5Fifo1IiED0Ev", scope: !"_ZTS5Fifo1IiE", file: !137, line: 40, type: !234, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiED0Ev, declaration: !241, variables: !2)
!275 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN5Fifo1IiE8enq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 26, type: !226, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8enq__RDYEv, declaration: !225, variables: !2)
!276 = !DISubprogram(name: "enq", linkageName: "_ZN5Fifo1IiE3enqEi", scope: !"_ZTS5Fifo1IiE", file: !137, line: 26, type: !230, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*, i32)* @_ZN5Fifo1IiE3enqEi, declaration: !229, variables: !2)
!277 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN5Fifo1IiE8deq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 30, type: !226, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8deq__RDYEv, declaration: !232, variables: !2)
!278 = !DISubprogram(name: "deq", linkageName: "_ZN5Fifo1IiE3deqEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 30, type: !234, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiE3deqEv, declaration: !233, variables: !2)
!279 = !DISubprogram(name: "first__RDY", linkageName: "_ZN5Fifo1IiE10first__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 33, type: !226, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE10first__RDYEv, declaration: !236, variables: !2)
!280 = !DISubprogram(name: "first", linkageName: "_ZN5Fifo1IiE5firstEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 33, type: !238, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, function: i32 (%class.Fifo1*)* @_ZN5Fifo1IiE5firstEv, declaration: !237, variables: !2)
!281 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK5Fifo1IiE8notEmptyEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 41, type: !243, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE8notEmptyEv, declaration: !242, variables: !2)
!282 = !DISubprogram(name: "notFull", linkageName: "_ZNK5Fifo1IiE7notFullEv", scope: !"_ZTS5Fifo1IiE", file: !137, line: 42, type: !243, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE7notFullEv, declaration: !247, variables: !2)
!283 = !DISubprogram(name: "respond", linkageName: "_ZN4Echo7respondC2EPS_", scope: !"_ZTSN4Echo7respondE", file: !1, line: 44, type: !173, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, function: void (%"class.Echo::respond"*, %class.Echo*)* @_ZN4Echo7respondC2EPS_, declaration: !172, variables: !2)
!284 = !DISubprogram(name: "respond1", linkageName: "_ZN4Echo7respond8respond1C2EPS_", scope: !"_ZTSN4Echo7respond8respond1E", file: !1, line: 44, type: !188, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, function: void (%"class.Echo::respond::respond1"*, %class.Echo*)* @_ZN4Echo7respond8respond1C2EPS_, declaration: !187, variables: !2)
!285 = !DISubprogram(name: "Rule", linkageName: "_ZN4RuleC2Ev", scope: !"_ZTS4Rule", file: !84, line: 37, type: !118, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, function: void (%class.Rule*)* @_ZN4RuleC2Ev, declaration: !286, variables: !2)
!286 = !DISubprogram(name: "Rule", scope: !"_ZTS4Rule", type: !118, isLocal: false, isDefinition: false, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!287 = !DISubprogram(name: "addRule", linkageName: "_ZN6Module7addRuleEP4Rule", scope: !"_ZTS6Module", file: !84, line: 61, type: !100, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Module*, %class.Rule*)* @_ZN6Module7addRuleEP4Rule, declaration: !99, variables: !2)
!288 = !DISubprogram(name: "RDY", linkageName: "_ZN4Echo7respond8respond13RDYEv", scope: !"_ZTSN4Echo7respond8respond1E", file: !1, line: 44, type: !181, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%"class.Echo::respond::respond1"*)* @_ZN4Echo7respond8respond13RDYEv, declaration: !180, variables: !2)
!289 = !DISubprogram(name: "ENA", linkageName: "_ZN4Echo7respond8respond13ENAEv", scope: !"_ZTSN4Echo7respond8respond1E", file: !1, line: 44, type: !185, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, function: void (%"class.Echo::respond::respond1"*)* @_ZN4Echo7respond8respond13ENAEv, declaration: !184, variables: !2)
!290 = !DISubprogram(name: "respond2", linkageName: "_ZN4Echo7respond8respond2C2EPS_", scope: !"_ZTSN4Echo7respond8respond2E", file: !1, line: 44, type: !202, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, function: void (%"class.Echo::respond::respond2"*, %class.Echo*)* @_ZN4Echo7respond8respond2C2EPS_, declaration: !201, variables: !2)
!291 = !DISubprogram(name: "RDY", linkageName: "_ZN4Echo7respond8respond23RDYEv", scope: !"_ZTSN4Echo7respond8respond2E", file: !1, line: 44, type: !195, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%"class.Echo::respond::respond2"*)* @_ZN4Echo7respond8respond23RDYEv, declaration: !194, variables: !2)
!292 = !DISubprogram(name: "ENA", linkageName: "_ZN4Echo7respond8respond23ENAEv", scope: !"_ZTSN4Echo7respond8respond2E", file: !1, line: 44, type: !199, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, function: void (%"class.Echo::respond::respond2"*)* @_ZN4Echo7respond8respond23ENAEv, declaration: !198, variables: !2)
!293 = !DISubprogram(name: "drive", linkageName: "_ZN8EchoTest5driveC2EPS_", scope: !"_ZTSN8EchoTest5driveE", file: !1, line: 71, type: !217, isLocal: false, isDefinition: true, scopeLine: 71, flags: DIFlagPrototyped, isOptimized: false, function: void (%"class.EchoTest::drive"*, %class.EchoTest*)* @_ZN8EchoTest5driveC2EPS_, declaration: !216, variables: !2)
!294 = !DISubprogram(name: "RDY", linkageName: "_ZN8EchoTest5drive3RDYEv", scope: !"_ZTSN8EchoTest5driveE", file: !1, line: 71, type: !210, isLocal: false, isDefinition: true, scopeLine: 71, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%"class.EchoTest::drive"*)* @_ZN8EchoTest5drive3RDYEv, declaration: !209, variables: !2)
!295 = !DISubprogram(name: "ENA", linkageName: "_ZN8EchoTest5drive3ENAEv", scope: !"_ZTSN8EchoTest5driveE", file: !1, line: 71, type: !214, isLocal: false, isDefinition: true, scopeLine: 71, flags: DIFlagPrototyped, isOptimized: false, function: void (%"class.EchoTest::drive"*)* @_ZN8EchoTest5drive3ENAEv, declaration: !213, variables: !2)
!296 = !DISubprogram(name: "~EchoTest", linkageName: "_ZN8EchoTestD2Ev", scope: !"_ZTS8EchoTest", file: !1, line: 79, type: !79, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoTest*)* @_ZN8EchoTestD2Ev, declaration: !82, variables: !2)
!297 = !DISubprogram(linkageName: "_GLOBAL__sub_I_echo.cpp", scope: !1, file: !1, type: !298, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, function: void ()* @_GLOBAL__sub_I_echo.cpp, variables: !2)
!298 = !DISubroutineType(types: !2)
!299 = !{!300}
!300 = !DIGlobalVariable(name: "echoTest", scope: !0, file: !1, line: 82, type: !"_ZTS8EchoTest", isLocal: false, isDefinition: true, variable: %class.EchoTest* @echoTest)
!301 = !{!302, !306, !307, !311}
!302 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !303, entity: !305, line: 56)
!303 = !DINamespace(name: "__gnu_debug", scope: null, file: !304, line: 54)
!304 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!305 = !DINamespace(name: "__debug", scope: !7, file: !304, line: 48)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !"_ZTSNSt15__exception_ptr13exception_ptrE", line: 58)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !310, line: 44)
!308 = !DINamespace(name: "__gnu_cxx", scope: null, file: !309, line: 68)
!309 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !7, file: !8, line: 186, baseType: !93)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !312, line: 45)
!312 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !7, file: !8, line: 187, baseType: !219)
!313 = !{i32 2, !"Dwarf Version", i32 4}
!314 = !{i32 2, !"Debug Info Version", i32 3}
!315 = !{!"clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)"}
!316 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "v", arg: 1, scope: !250, file: !1, line: 61, type: !65)
!317 = !DIExpression()
!318 = !DILocation(line: 61, column: 31, scope: !250)
!319 = !DILocation(line: 63, column: 35, scope: !250)
!320 = !DILocation(line: 63, column: 5, scope: !250)
!321 = !DILocation(line: 64, column: 23, scope: !250)
!322 = !DILocation(line: 65, column: 1, scope: !250)
!323 = !DILocation(line: 82, column: 10, scope: !251)
!324 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !262, type: !208, flags: DIFlagArtificial | DIFlagObjectPointer)
!325 = !DILocation(line: 0, scope: !262)
!326 = !DILocation(line: 76, column: 97, scope: !262)
!327 = !DILocation(line: 76, column: 15, scope: !262)
!328 = !DILocation(line: 76, column: 37, scope: !262)
!329 = !DILocation(line: 76, column: 42, scope: !262)
!330 = !DILocation(line: 76, column: 51, scope: !262)
!331 = !DILocation(line: 76, column: 55, scope: !262)
!332 = !DILocation(line: 76, column: 46, scope: !262)
!333 = !DILocation(line: 76, column: 75, scope: !262)
!334 = !DILocation(line: 76, column: 81, scope: !262)
!335 = !DILocation(line: 77, column: 7, scope: !336)
!336 = distinct !DILexicalBlock(scope: !262, file: !1, line: 76, column: 97)
!337 = !DILocation(line: 78, column: 3, scope: !262)
!338 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !296, type: !208, flags: DIFlagArtificial | DIFlagObjectPointer)
!339 = !DILocation(line: 0, scope: !296)
!340 = !DILocation(line: 79, column: 16, scope: !296)
!341 = !DILocation(line: 82, column: 10, scope: !254)
!342 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "argc", arg: 1, scope: !255, file: !1, line: 84, type: !65)
!343 = !DILocation(line: 84, column: 14, scope: !255)
!344 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "argv", arg: 2, scope: !255, file: !1, line: 84, type: !258)
!345 = !DILocation(line: 84, column: 32, scope: !255)
!346 = !DILocation(line: 86, column: 59, scope: !255)
!347 = !DILocation(line: 86, column: 3, scope: !255)
!348 = !DILocation(line: 87, column: 7, scope: !349)
!349 = distinct !DILexicalBlock(scope: !255, file: !1, line: 87, column: 7)
!350 = !DILocation(line: 87, column: 12, scope: !349)
!351 = !DILocation(line: 87, column: 7, scope: !255)
!352 = !DILocation(line: 88, column: 7, scope: !349)
!353 = !DILocation(line: 89, column: 3, scope: !255)
!354 = !DILocation(line: 90, column: 3, scope: !255)
!355 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !263, type: !89, flags: DIFlagArtificial | DIFlagObjectPointer)
!356 = !DILocation(line: 0, scope: !263)
!357 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "size", arg: 2, scope: !263, file: !84, line: 54, type: !91)
!358 = !DILocation(line: 54, column: 17, scope: !263)
!359 = !DILocation(line: 54, column: 24, scope: !263)
!360 = !DILocation(line: 54, column: 38, scope: !263)
!361 = !DILocation(line: 54, column: 43, scope: !263)
!362 = !DILocation(line: 54, column: 51, scope: !263)
!363 = !DILocation(line: 54, column: 56, scope: !263)
!364 = !DILocation(line: 55, column: 96, scope: !365)
!365 = distinct !DILexicalBlock(scope: !263, file: !84, line: 54, column: 62)
!366 = !DILocation(line: 55, column: 115, scope: !365)
!367 = !DILocation(line: 55, column: 6, scope: !365)
!368 = !DILocation(line: 56, column: 12, scope: !365)
!369 = !DILocation(line: 60, column: 3, scope: !263)
!370 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !264, type: !126, flags: DIFlagArtificial | DIFlagObjectPointer)
!371 = !DILocation(line: 0, scope: !264)
!372 = !DILocation(line: 35, column: 21, scope: !264)
!373 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !265, type: !75, flags: DIFlagArtificial | DIFlagObjectPointer)
!374 = !DILocation(line: 0, scope: !265)
!375 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "ind", arg: 2, scope: !265, file: !1, line: 51, type: !126)
!376 = !DILocation(line: 51, column: 24, scope: !265)
!377 = !DILocation(line: 51, column: 105, scope: !265)
!378 = !DILocation(line: 51, column: 31, scope: !265)
!379 = !DILocation(line: 51, column: 53, scope: !265)
!380 = !DILocation(line: 51, column: 58, scope: !265)
!381 = !DILocation(line: 51, column: 62, scope: !265)
!382 = !DILocation(line: 51, column: 77, scope: !265)
!383 = !DILocation(line: 51, column: 81, scope: !265)
!384 = !DILocation(line: 51, column: 87, scope: !265)
!385 = !DILocation(line: 52, column: 83, scope: !386)
!386 = distinct !DILexicalBlock(scope: !265, file: !1, line: 51, column: 105)
!387 = !DILocation(line: 52, column: 5, scope: !386)
!388 = !DILocation(line: 53, column: 3, scope: !265)
!389 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !293, type: !390, flags: DIFlagArtificial | DIFlagObjectPointer)
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN8EchoTest5driveE", size: 64, align: 64)
!391 = !DILocation(line: 0, scope: !293)
!392 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "module", arg: 2, scope: !293, file: !1, line: 71, type: !208)
!393 = !DILocation(line: 71, column: 3, scope: !293)
!394 = !DILocation(line: 71, column: 3, scope: !395)
!395 = distinct !DILexicalBlock(scope: !293, file: !1, line: 71, column: 3)
!396 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !266, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!397 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS5Fifo1IiE", size: 64, align: 64)
!398 = !DILocation(line: 0, scope: !266)
!399 = !DILocation(line: 37, column: 17, scope: !266)
!400 = !DILocation(line: 36, column: 13, scope: !266)
!401 = !DILocation(line: 37, column: 5, scope: !266)
!402 = !DILocation(line: 38, column: 5, scope: !403)
!403 = distinct !DILexicalBlock(scope: !266, file: !137, line: 37, column: 17)
!404 = !DILocation(line: 39, column: 3, scope: !266)
!405 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !283, type: !406, flags: DIFlagArtificial | DIFlagObjectPointer)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN4Echo7respondE", size: 64, align: 64)
!407 = !DILocation(line: 0, scope: !283)
!408 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "module", arg: 2, scope: !283, file: !1, line: 44, type: !75)
!409 = !DILocation(line: 44, column: 3, scope: !283)
!410 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !267, type: !124, flags: DIFlagArtificial | DIFlagObjectPointer)
!411 = !DILocation(line: 0, scope: !267)
!412 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "size", arg: 2, scope: !267, file: !137, line: 10, type: !91)
!413 = !DILocation(line: 10, column: 15, scope: !267)
!414 = !DILocation(line: 10, column: 35, scope: !267)
!415 = !DILocation(line: 10, column: 29, scope: !267)
!416 = !DILocation(line: 10, column: 22, scope: !267)
!417 = !DILocation(line: 10, column: 36, scope: !267)
!418 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !273, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!419 = !DILocation(line: 0, scope: !273)
!420 = !DILocation(line: 40, column: 13, scope: !421)
!421 = distinct !DILexicalBlock(scope: !273, file: !137, line: 40, column: 12)
!422 = !DILocation(line: 40, column: 13, scope: !273)
!423 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !274, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!424 = !DILocation(line: 0, scope: !274)
!425 = !DILocation(line: 40, column: 12, scope: !274)
!426 = !DILocation(line: 40, column: 13, scope: !274)
!427 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !275, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!428 = !DILocation(line: 0, scope: !275)
!429 = !DILocation(line: 26, column: 3, scope: !275)
!430 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !276, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!431 = !DILocation(line: 0, scope: !276)
!432 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "v", arg: 2, scope: !276, file: !137, line: 26, type: !65)
!433 = !DILocation(line: 26, column: 3, scope: !276)
!434 = !DILocation(line: 27, column: 17, scope: !276)
!435 = !DILocation(line: 27, column: 7, scope: !276)
!436 = !DILocation(line: 27, column: 15, scope: !276)
!437 = !DILocation(line: 28, column: 7, scope: !276)
!438 = !DILocation(line: 28, column: 12, scope: !276)
!439 = !DILocation(line: 29, column: 5, scope: !276)
!440 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !277, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!441 = !DILocation(line: 0, scope: !277)
!442 = !DILocation(line: 30, column: 3, scope: !277)
!443 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !278, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!444 = !DILocation(line: 0, scope: !278)
!445 = !DILocation(line: 31, column: 7, scope: !278)
!446 = !DILocation(line: 31, column: 12, scope: !278)
!447 = !DILocation(line: 32, column: 5, scope: !278)
!448 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !279, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!449 = !DILocation(line: 0, scope: !279)
!450 = !DILocation(line: 33, column: 3, scope: !279)
!451 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !280, type: !397, flags: DIFlagArtificial | DIFlagObjectPointer)
!452 = !DILocation(line: 0, scope: !280)
!453 = !DILocation(line: 34, column: 12, scope: !280)
!454 = !DILocation(line: 34, column: 5, scope: !280)
!455 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !281, type: !456, flags: DIFlagArtificial | DIFlagObjectPointer)
!456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64, align: 64)
!457 = !DILocation(line: 0, scope: !281)
!458 = !DILocation(line: 41, column: 34, scope: !281)
!459 = !DILocation(line: 41, column: 27, scope: !281)
!460 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !282, type: !456, flags: DIFlagArtificial | DIFlagObjectPointer)
!461 = !DILocation(line: 0, scope: !282)
!462 = !DILocation(line: 42, column: 34, scope: !282)
!463 = !DILocation(line: 42, column: 33, scope: !282)
!464 = !DILocation(line: 42, column: 26, scope: !282)
!465 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !268, type: !124, flags: DIFlagArtificial | DIFlagObjectPointer)
!466 = !DILocation(line: 0, scope: !268)
!467 = !DILocation(line: 11, column: 20, scope: !268)
!468 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !269, type: !124, flags: DIFlagArtificial | DIFlagObjectPointer)
!469 = !DILocation(line: 0, scope: !269)
!470 = !DILocation(line: 11, column: 19, scope: !269)
!471 = !DILocation(line: 11, column: 20, scope: !269)
!472 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !270, type: !124, flags: DIFlagArtificial | DIFlagObjectPointer)
!473 = !DILocation(line: 0, scope: !270)
!474 = !DILocation(line: 12, column: 3, scope: !270)
!475 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !271, type: !124, flags: DIFlagArtificial | DIFlagObjectPointer)
!476 = !DILocation(line: 0, scope: !271)
!477 = !DILocation(line: 13, column: 3, scope: !271)
!478 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !272, type: !124, flags: DIFlagArtificial | DIFlagObjectPointer)
!479 = !DILocation(line: 0, scope: !272)
!480 = !DILocation(line: 14, column: 3, scope: !272)
!481 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !284, type: !482, flags: DIFlagArtificial | DIFlagObjectPointer)
!482 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN4Echo7respond8respond1E", size: 64, align: 64)
!483 = !DILocation(line: 0, scope: !284)
!484 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "module", arg: 2, scope: !284, file: !1, line: 44, type: !75)
!485 = !DILocation(line: 44, column: 3, scope: !284)
!486 = !DILocation(line: 44, column: 3, scope: !487)
!487 = distinct !DILexicalBlock(scope: !284, file: !1, line: 44, column: 3)
!488 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !290, type: !489, flags: DIFlagArtificial | DIFlagObjectPointer)
!489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSN4Echo7respond8respond2E", size: 64, align: 64)
!490 = !DILocation(line: 0, scope: !290)
!491 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "module", arg: 2, scope: !290, file: !1, line: 44, type: !75)
!492 = !DILocation(line: 44, column: 3, scope: !290)
!493 = !DILocation(line: 44, column: 3, scope: !494)
!494 = distinct !DILexicalBlock(scope: !290, file: !1, line: 44, column: 3)
!495 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !285, type: !87, flags: DIFlagArtificial | DIFlagObjectPointer)
!496 = !DILocation(line: 0, scope: !285)
!497 = !DILocation(line: 37, column: 7, scope: !285)
!498 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !287, type: !89, flags: DIFlagArtificial | DIFlagObjectPointer)
!499 = !DILocation(line: 0, scope: !287)
!500 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "rule", arg: 2, scope: !287, file: !84, line: 61, type: !87)
!501 = !DILocation(line: 61, column: 22, scope: !287)
!502 = !DILocation(line: 62, column: 119, scope: !287)
!503 = !DILocation(line: 62, column: 127, scope: !287)
!504 = !DILocation(line: 62, column: 141, scope: !287)
!505 = !DILocation(line: 62, column: 160, scope: !287)
!506 = !DILocation(line: 62, column: 166, scope: !287)
!507 = !DILocation(line: 62, column: 149, scope: !287)
!508 = !DILocation(line: 62, column: 171, scope: !287)
!509 = !DILocation(line: 62, column: 147, scope: !287)
!510 = !DILocation(line: 62, column: 177, scope: !287)
!511 = !DILocation(line: 62, column: 183, scope: !287)
!512 = !DILocation(line: 62, column: 5, scope: !287)
!513 = !DILocation(line: 63, column: 18, scope: !287)
!514 = !DILocation(line: 63, column: 5, scope: !287)
!515 = !DILocation(line: 63, column: 11, scope: !287)
!516 = !DILocation(line: 63, column: 16, scope: !287)
!517 = !DILocation(line: 64, column: 14, scope: !287)
!518 = !DILocation(line: 64, column: 5, scope: !287)
!519 = !DILocation(line: 64, column: 12, scope: !287)
!520 = !DILocation(line: 65, column: 3, scope: !287)
!521 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !288, type: !482, flags: DIFlagArtificial | DIFlagObjectPointer)
!522 = !DILocation(line: 0, scope: !288)
!523 = !DILocation(line: 44, column: 3, scope: !288)
!524 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !289, type: !482, flags: DIFlagArtificial | DIFlagObjectPointer)
!525 = !DILocation(line: 0, scope: !289)
!526 = !DILocation(line: 44, column: 3, scope: !289)
!527 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !291, type: !489, flags: DIFlagArtificial | DIFlagObjectPointer)
!528 = !DILocation(line: 0, scope: !291)
!529 = !DILocation(line: 44, column: 3, scope: !291)
!530 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !292, type: !489, flags: DIFlagArtificial | DIFlagObjectPointer)
!531 = !DILocation(line: 0, scope: !292)
!532 = !DILocation(line: 44, column: 3, scope: !292)
!533 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !294, type: !390, flags: DIFlagArtificial | DIFlagObjectPointer)
!534 = !DILocation(line: 0, scope: !294)
!535 = !DILocation(line: 71, column: 3, scope: !294)
!536 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !295, type: !390, flags: DIFlagArtificial | DIFlagObjectPointer)
!537 = !DILocation(line: 0, scope: !295)
!538 = !DILocation(line: 71, column: 3, scope: !295)
!539 = !DILocation(line: 0, scope: !297)
