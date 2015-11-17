; ModuleID = 'echo.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.EchoTest = type <{ %class.Module, %class.Echo*, i32, [4 x i8] }>
%class.Module = type { %class.Rule*, %class.Module*, i64 }
%class.Rule = type { i32 (...)**, %class.Rule* }
%class.Echo = type <{ %class.Module, %class.Fifo*, %class.EchoIndication*, i32, [4 x i8] }>
%class.Fifo = type { i32 (...)**, %class.Module }
%class.EchoIndication = type { i8 }
%class.drive = type { %class.Rule, %class.EchoTest* }
%class.respond = type { %class.Rule, %class.Echo* }
%class.Fifo1 = type <{ %class.Fifo, i32, i8, [3 x i8] }>

$_ZN8EchoTestC2Ev = comdat any

$_ZN8EchoTestD2Ev = comdat any

$_ZN6ModuleC2Em = comdat any

$_ZN14EchoIndicationC2Ev = comdat any

$_ZN4EchoC2EP14EchoIndication = comdat any

$_ZZN8EchoTestC1EvEN5driveC2EPS_ = comdat any

$_ZN5Fifo1IiEC2Ev = comdat any

$_ZZN4EchoC1EP14EchoIndicationEN7respondC2EPS_ = comdat any

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

$_ZN4RuleC2Ev = comdat any

$_ZN6Module7addRuleEP4Rule = comdat any

$_ZZN4EchoC1EP14EchoIndicationEN7respond3RDYEv = comdat any

$_ZZN4EchoC1EP14EchoIndicationEN7respond3ENAEv = comdat any

$_ZZN8EchoTestC1EvEN5drive3RDYEv = comdat any

$_ZZN8EchoTestC1EvEN5drive3ENAEv = comdat any

$_ZZN8EchoTestC1EvE9driveRule = comdat any

$_ZGVZN8EchoTestC1EvE9driveRule = comdat any

$_ZZN4EchoC1EP14EchoIndicationE11respondRule = comdat any

$_ZGVZN4EchoC1EP14EchoIndicationE11respondRule = comdat any

$_ZTV5Fifo1IiE = comdat any

$_ZTS5Fifo1IiE = comdat any

$_ZTS4FifoIiE = comdat any

$_ZTS6Module = comdat any

$_ZTI6Module = comdat any

$_ZTI4FifoIiE = comdat any

$_ZTI5Fifo1IiE = comdat any

$_ZTV4FifoIiE = comdat any

$_ZTVZN4EchoC1EP14EchoIndicationE7respond = comdat any

$_ZTSZN4EchoC1EP14EchoIndicationE7respond = comdat any

$_ZTS4Rule = comdat any

$_ZTI4Rule = comdat any

$_ZTIZN4EchoC1EP14EchoIndicationE7respond = comdat any

$_ZTV4Rule = comdat any

$_ZTVZN8EchoTestC1EvE5drive = comdat any

$_ZTSZN8EchoTestC1EvE5drive = comdat any

$_ZTIZN8EchoTestC1EvE5drive = comdat any

@.str = private unnamed_addr constant [19 x i8] c"Heard an echo: %d\0A\00", align 1
@stop_main_program = external global i32, align 4
@echoTest = global %class.EchoTest zeroinitializer, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"[%s:%d] starting %d\0A\00", align 1
@__FUNCTION__.main = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"[%s:%d] ending\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"EchoTest: addr %p size 0x%lx csize 0x%lx\0A\00", align 1
@_ZZN8EchoTestC1EvE9driveRule = linkonce_odr global %class.drive* null, comdat, align 8
@_ZGVZN8EchoTestC1EvE9driveRule = linkonce_odr global i64 0, comdat
@_ZN6Module5firstE = external global %class.Module*, align 8
@.str.4 = private unnamed_addr constant [57 x i8] c"[%s] add module to list first [%p]=%p this %p size %ld.\0A\00", align 1
@__FUNCTION__._ZN6ModuleC2Em = private unnamed_addr constant [7 x i8] c"Module\00", align 1
@.str.5 = private unnamed_addr constant [46 x i8] c"Echo: this %p size 0x%lx fifo %p csize 0x%lx\0A\00", align 1
@_ZZN4EchoC1EP14EchoIndicationE11respondRule = linkonce_odr global %class.respond* null, comdat, align 8
@_ZGVZN4EchoC1EP14EchoIndicationE11respondRule = linkonce_odr global i64 0, comdat
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
@_ZTVZN4EchoC1EP14EchoIndicationE7respond = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIZN4EchoC1EP14EchoIndicationE7respond to i8*), i8* bitcast (i1 (%class.respond*)* @_ZZN4EchoC1EP14EchoIndicationEN7respond3RDYEv to i8*), i8* bitcast (void (%class.respond*)* @_ZZN4EchoC1EP14EchoIndicationEN7respond3ENAEv to i8*)], comdat, align 8
@_ZTSZN4EchoC1EP14EchoIndicationE7respond = linkonce_odr constant [37 x i8] c"ZN4EchoC1EP14EchoIndicationE7respond\00", comdat
@_ZTS4Rule = linkonce_odr constant [6 x i8] c"4Rule\00", comdat
@_ZTI4Rule = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_ZTS4Rule, i32 0, i32 0) }, comdat
@_ZTIZN4EchoC1EP14EchoIndicationE7respond = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @_ZTSZN4EchoC1EP14EchoIndicationE7respond, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI4Rule to i8*) }, comdat
@_ZTV4Rule = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTI4Rule to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)], comdat, align 8
@.str.7 = private unnamed_addr constant [88 x i8] c"[%s] add rule to module list rfirst [%p]=%p this %p rule %p rulevptr %p &rule->next %p\0A\00", align 1
@__FUNCTION__._ZN6Module7addRuleEP4Rule = private unnamed_addr constant [8 x i8] c"addRule\00", align 1
@_ZTVZN8EchoTestC1EvE5drive = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIZN8EchoTestC1EvE5drive to i8*), i8* bitcast (i1 (%class.drive*)* @_ZZN8EchoTestC1EvEN5drive3RDYEv to i8*), i8* bitcast (void (%class.drive*)* @_ZZN8EchoTestC1EvEN5drive3ENAEv to i8*)], comdat, align 8
@_ZTSZN8EchoTestC1EvE5drive = linkonce_odr constant [23 x i8] c"ZN8EchoTestC1EvE5drive\00", comdat
@_ZTIZN8EchoTestC1EvE5drive = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @_ZTSZN8EchoTestC1EvE5drive, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI4Rule to i8*) }, comdat
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_echo.cpp, i8* null }]

; Function Attrs: nounwind
define void @_ZN14EchoIndication4echoEi(i32 %v) #0 align 2 {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !292, metadata !293), !dbg !294
  %0 = load i32, i32* %v.addr, align 4, !dbg !295
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !296
  store i32 1, i32* @stop_main_program, align 4, !dbg !297
  ret void, !dbg !298
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
entry:
  call void @_ZN8EchoTestC2Ev(%class.EchoTest* @echoTest), !dbg !299
  %0 = call i32 @atexit(void ()* @__dtor_echoTest) #3, !dbg !299
  ret void, !dbg !299
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTestC2Ev(%class.EchoTest* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoTest*, align 8
  store %class.EchoTest* %this, %class.EchoTest** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %this.addr, metadata !300, metadata !293), !dbg !301
  %this1 = load %class.EchoTest*, %class.EchoTest** %this.addr
  %0 = bitcast %class.EchoTest* %this1 to %class.Module*, !dbg !302
  call void @_ZN6ModuleC2Em(%class.Module* %0, i64 48), !dbg !303
  %echo = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this1, i32 0, i32 1, !dbg !304
  %call = call noalias i8* @_Znwm(i64 48) #7, !dbg !305
  %1 = bitcast i8* %call to %class.Echo*, !dbg !305
  %call2 = call noalias i8* @_Znwm(i64 1) #7, !dbg !306
  %2 = bitcast i8* %call2 to %class.EchoIndication*, !dbg !306
  call void @_ZN14EchoIndicationC2Ev(%class.EchoIndication* %2), !dbg !307
  call void @_ZN4EchoC2EP14EchoIndication(%class.Echo* %1, %class.EchoIndication* %2), !dbg !308
  store %class.Echo* %1, %class.Echo** %echo, align 8, !dbg !304
  %x = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this1, i32 0, i32 2, !dbg !309
  store i32 7, i32* %x, align 4, !dbg !309
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), %class.EchoTest* %this1, i64 40, i64 40), !dbg !310
  %3 = load atomic i8, i8* bitcast (i64* @_ZGVZN8EchoTestC1EvE9driveRule to i8*) acquire, align 1, !dbg !312
  %guard.uninitialized = icmp eq i8 %3, 0, !dbg !312
  br i1 %guard.uninitialized, label %init.check, label %init.end, !dbg !312

init.check:                                       ; preds = %entry
  %4 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN8EchoTestC1EvE9driveRule) #3, !dbg !313
  %tobool = icmp ne i32 %4, 0, !dbg !313
  br i1 %tobool, label %init, label %init.end, !dbg !313

init:                                             ; preds = %init.check
  %call4 = call noalias i8* @_Znwm(i64 24) #7, !dbg !315
  %5 = bitcast i8* %call4 to %class.drive*, !dbg !315
  call void @_ZZN8EchoTestC1EvEN5driveC2EPS_(%class.drive* %5, %class.EchoTest* %this1), !dbg !315
  store %class.drive* %5, %class.drive** @_ZZN8EchoTestC1EvE9driveRule, align 8, !dbg !315
  call void @__cxa_guard_release(i64* @_ZGVZN8EchoTestC1EvE9driveRule) #3, !dbg !315
  br label %init.end, !dbg !315

init.end:                                         ; preds = %init, %init.check, %entry
  ret void, !dbg !317
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTestD2Ev(%class.EchoTest* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoTest*, align 8
  store %class.EchoTest* %this, %class.EchoTest** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %this.addr, metadata !318, metadata !293), !dbg !319
  %this1 = load %class.EchoTest*, %class.EchoTest** %this.addr
  ret void, !dbg !320
}

; Function Attrs: nounwind
define internal void @__dtor_echoTest() #0 section ".text.startup" {
entry:
  call void @_ZN8EchoTestD2Ev(%class.EchoTest* @echoTest), !dbg !321
  ret void, !dbg !321
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !322, metadata !293), !dbg !323
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !324, metadata !293), !dbg !325
  %0 = load i32, i32* %argc.addr, align 4, !dbg !326
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__FUNCTION__.main, i32 0, i32 0), i32 85, i32 %0), !dbg !327
  %1 = load i32, i32* %argc.addr, align 4, !dbg !328
  %cmp = icmp ne i32 %1, 1, !dbg !330
  br i1 %cmp, label %if.then, label %if.end, !dbg !331

if.then:                                          ; preds = %entry
  call void @_Z16run_main_programv(), !dbg !332
  br label %if.end, !dbg !332

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__FUNCTION__.main, i32 0, i32 0), i32 88), !dbg !333
  ret i32 0, !dbg !334
}

declare void @_Z16run_main_programv() #2

; Function Attrs: nounwind
define linkonce_odr void @_ZN6ModuleC2Em(%class.Module* %this, i64 %size) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Module*, align 8
  %size.addr = alloca i64, align 8
  store %class.Module* %this, %class.Module** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Module** %this.addr, metadata !335, metadata !293), !dbg !336
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !337, metadata !293), !dbg !338
  %this1 = load %class.Module*, %class.Module** %this.addr
  %rfirst = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !339
  store %class.Rule* null, %class.Rule** %rfirst, align 8, !dbg !339
  %next = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 1, !dbg !340
  %0 = load %class.Module*, %class.Module** @_ZN6Module5firstE, align 8, !dbg !341
  store %class.Module* %0, %class.Module** %next, align 8, !dbg !340
  %size2 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 2, !dbg !342
  %1 = load i64, i64* %size.addr, align 8, !dbg !343
  store i64 %1, i64* %size2, align 8, !dbg !342
  %2 = load %class.Module*, %class.Module** @_ZN6Module5firstE, align 8, !dbg !344
  %3 = load i64, i64* %size.addr, align 8, !dbg !346
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__FUNCTION__._ZN6ModuleC2Em, i32 0, i32 0), %class.Module** @_ZN6Module5firstE, %class.Module* %2, %class.Module* %this1, i64 %3), !dbg !347
  store %class.Module* %this1, %class.Module** @_ZN6Module5firstE, align 8, !dbg !348
  ret void, !dbg !349
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #4

; Function Attrs: nounwind
define linkonce_odr void @_ZN14EchoIndicationC2Ev(%class.EchoIndication* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoIndication*, align 8
  store %class.EchoIndication* %this, %class.EchoIndication** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoIndication** %this.addr, metadata !350, metadata !293), !dbg !351
  %this1 = load %class.EchoIndication*, %class.EchoIndication** %this.addr
  ret void, !dbg !352
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4EchoC2EP14EchoIndication(%class.Echo* %this, %class.EchoIndication* %ind) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Echo*, align 8
  %ind.addr = alloca %class.EchoIndication*, align 8
  store %class.Echo* %this, %class.Echo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Echo** %this.addr, metadata !353, metadata !293), !dbg !354
  store %class.EchoIndication* %ind, %class.EchoIndication** %ind.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoIndication** %ind.addr, metadata !355, metadata !293), !dbg !356
  %this1 = load %class.Echo*, %class.Echo** %this.addr
  %0 = bitcast %class.Echo* %this1 to %class.Module*, !dbg !357
  call void @_ZN6ModuleC2Em(%class.Module* %0, i64 48), !dbg !358
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 1, !dbg !359
  %call = call noalias i8* @_Znwm(i64 40) #7, !dbg !360
  %1 = bitcast i8* %call to %class.Fifo1*, !dbg !360
  call void @_ZN5Fifo1IiEC2Ev(%class.Fifo1* %1), !dbg !361
  %2 = bitcast %class.Fifo1* %1 to %class.Fifo*, !dbg !360
  store %class.Fifo* %2, %class.Fifo** %fifo, align 8, !dbg !359
  %ind2 = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 2, !dbg !362
  %3 = load %class.EchoIndication*, %class.EchoIndication** %ind.addr, align 8, !dbg !363
  store %class.EchoIndication* %3, %class.EchoIndication** %ind2, align 8, !dbg !362
  %fifo3 = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 1, !dbg !364
  %4 = load %class.Fifo*, %class.Fifo** %fifo3, align 8, !dbg !364
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.5, i32 0, i32 0), %class.Echo* %this1, i64 48, %class.Fifo* %4, i64 48), !dbg !366
  %5 = load atomic i8, i8* bitcast (i64* @_ZGVZN4EchoC1EP14EchoIndicationE11respondRule to i8*) acquire, align 1, !dbg !367
  %guard.uninitialized = icmp eq i8 %5, 0, !dbg !367
  br i1 %guard.uninitialized, label %init.check, label %init.end, !dbg !367

init.check:                                       ; preds = %entry
  %6 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN4EchoC1EP14EchoIndicationE11respondRule) #3, !dbg !368
  %tobool = icmp ne i32 %6, 0, !dbg !368
  br i1 %tobool, label %init, label %init.end, !dbg !368

init:                                             ; preds = %init.check
  %call5 = call noalias i8* @_Znwm(i64 24) #7, !dbg !370
  %7 = bitcast i8* %call5 to %class.respond*, !dbg !370
  call void @_ZZN4EchoC1EP14EchoIndicationEN7respondC2EPS_(%class.respond* %7, %class.Echo* %this1), !dbg !370
  store %class.respond* %7, %class.respond** @_ZZN4EchoC1EP14EchoIndicationE11respondRule, align 8, !dbg !370
  call void @__cxa_guard_release(i64* @_ZGVZN4EchoC1EP14EchoIndicationE11respondRule) #3, !dbg !370
  br label %init.end, !dbg !370

init.end:                                         ; preds = %init, %init.check, %entry
  ret void, !dbg !372
}

; Function Attrs: nounwind
declare i32 @__cxa_guard_acquire(i64*) #3

; Function Attrs: nounwind
define linkonce_odr void @_ZZN8EchoTestC1EvEN5driveC2EPS_(%class.drive* %this, %class.EchoTest* %module) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.drive*, align 8
  %module.addr = alloca %class.EchoTest*, align 8
  store %class.drive* %this, %class.drive** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.drive** %this.addr, metadata !373, metadata !293), !dbg !374
  store %class.EchoTest* %module, %class.EchoTest** %module.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %module.addr, metadata !375, metadata !293), !dbg !376
  %this1 = load %class.drive*, %class.drive** %this.addr
  %0 = bitcast %class.drive* %this1 to %class.Rule*, !dbg !376
  call void @_ZN4RuleC2Ev(%class.Rule* %0) #3, !dbg !376
  %1 = bitcast %class.drive* %this1 to i32 (...)***, !dbg !376
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTVZN8EchoTestC1EvE5drive, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !376
  %module2 = getelementptr inbounds %class.drive, %class.drive* %this1, i32 0, i32 1, !dbg !376
  %2 = load %class.EchoTest*, %class.EchoTest** %module.addr, align 8, !dbg !376
  store %class.EchoTest* %2, %class.EchoTest** %module2, align 8, !dbg !376
  %3 = load %class.EchoTest*, %class.EchoTest** %module.addr, align 8, !dbg !377
  %4 = bitcast %class.EchoTest* %3 to %class.Module*, !dbg !377
  %5 = bitcast %class.drive* %this1 to %class.Rule*, !dbg !377
  call void @_ZN6Module7addRuleEP4Rule(%class.Module* %4, %class.Rule* %5), !dbg !377
  ret void, !dbg !376
}

; Function Attrs: nounwind
declare void @__cxa_guard_release(i64*) #3

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiEC2Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !379, metadata !293), !dbg !381
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to %class.Fifo*, !dbg !382
  call void @_ZN4FifoIiEC2Em(%class.Fifo* %0, i64 40), !dbg !383
  %1 = bitcast %class.Fifo1* %this1 to i32 (...)***, !dbg !382
  store i32 (...)** bitcast (i8** getelementptr inbounds ([12 x i8*], [12 x i8*]* @_ZTV5Fifo1IiE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !382
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !384
  store i8 0, i8* %full, align 1, !dbg !384
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i32 0, i32 0), %class.Fifo1* %this1, i64 40), !dbg !385
  ret void, !dbg !387
}

; Function Attrs: nounwind
define linkonce_odr void @_ZZN4EchoC1EP14EchoIndicationEN7respondC2EPS_(%class.respond* %this, %class.Echo* %module) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.respond*, align 8
  %module.addr = alloca %class.Echo*, align 8
  store %class.respond* %this, %class.respond** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.respond** %this.addr, metadata !388, metadata !293), !dbg !389
  store %class.Echo* %module, %class.Echo** %module.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Echo** %module.addr, metadata !390, metadata !293), !dbg !391
  %this1 = load %class.respond*, %class.respond** %this.addr
  %0 = bitcast %class.respond* %this1 to %class.Rule*, !dbg !391
  call void @_ZN4RuleC2Ev(%class.Rule* %0) #3, !dbg !391
  %1 = bitcast %class.respond* %this1 to i32 (...)***, !dbg !391
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTVZN4EchoC1EP14EchoIndicationE7respond, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !391
  %module2 = getelementptr inbounds %class.respond, %class.respond* %this1, i32 0, i32 1, !dbg !391
  %2 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !391
  store %class.Echo* %2, %class.Echo** %module2, align 8, !dbg !391
  %3 = load %class.Echo*, %class.Echo** %module.addr, align 8, !dbg !392
  %4 = bitcast %class.Echo* %3 to %class.Module*, !dbg !392
  %5 = bitcast %class.respond* %this1 to %class.Rule*, !dbg !392
  call void @_ZN6Module7addRuleEP4Rule(%class.Module* %4, %class.Rule* %5), !dbg !392
  ret void, !dbg !391
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiEC2Em(%class.Fifo* %this, i64 %size) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  %size.addr = alloca i64, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !394, metadata !293), !dbg !395
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !396, metadata !293), !dbg !397
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i8*, !dbg !398
  %1 = getelementptr inbounds i8, i8* %0, i64 8, !dbg !398
  %2 = bitcast i8* %1 to %class.Module*, !dbg !398
  %3 = load i64, i64* %size.addr, align 8, !dbg !399
  call void @_ZN6ModuleC2Em(%class.Module* %2, i64 %3), !dbg !400
  %4 = bitcast %class.Fifo* %this1 to i32 (...)***, !dbg !398
  store i32 (...)** bitcast (i8** getelementptr inbounds ([12 x i8*], [12 x i8*]* @_ZTV4FifoIiE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %4, !dbg !398
  ret void, !dbg !401
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiED2Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !402, metadata !293), !dbg !403
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to %class.Fifo*, !dbg !404
  call void @_ZN4FifoIiED2Ev(%class.Fifo* %0) #3, !dbg !404
  ret void, !dbg !406
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiED0Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !407, metadata !293), !dbg !408
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  call void @_ZN5Fifo1IiED2Ev(%class.Fifo1* %this1) #3, !dbg !409
  %0 = bitcast %class.Fifo1* %this1 to i8*, !dbg !409
  call void @_ZdlPv(i8* %0) #8, !dbg !409
  ret void, !dbg !410
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE8enq__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !411, metadata !293), !dbg !412
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !413
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !413
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 9, !dbg !413
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !413
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !413
  ret i1 %call, !dbg !413
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiE3enqEi(%class.Fifo1* %this, i32 %v) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  %v.addr = alloca i32, align 4
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !414, metadata !293), !dbg !415
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !416, metadata !293), !dbg !417
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = load i32, i32* %v.addr, align 4, !dbg !418
  %element = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 1, !dbg !419
  store i32 %0, i32* %element, align 4, !dbg !420
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !421
  store i8 1, i8* %full, align 1, !dbg !422
  ret void, !dbg !423
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE8deq__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !424, metadata !293), !dbg !425
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !426
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !426
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 8, !dbg !426
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !426
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !426
  ret i1 %call, !dbg !426
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiE3deqEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !427, metadata !293), !dbg !428
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !429
  store i8 0, i8* %full, align 1, !dbg !430
  ret void, !dbg !431
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE10first__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !432, metadata !293), !dbg !433
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !434
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !434
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 8, !dbg !434
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !434
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !434
  ret i1 %call, !dbg !434
}

; Function Attrs: nounwind
define linkonce_odr i32 @_ZN5Fifo1IiE5firstEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !435, metadata !293), !dbg !436
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %element = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 1, !dbg !437
  %0 = load i32, i32* %element, align 4, !dbg !437
  ret i32 %0, !dbg !438
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZNK5Fifo1IiE8notEmptyEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !439, metadata !293), !dbg !441
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !442
  %0 = load i8, i8* %full, align 1, !dbg !442
  %tobool = trunc i8 %0 to i1, !dbg !442
  ret i1 %tobool, !dbg !443
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZNK5Fifo1IiE7notFullEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !444, metadata !293), !dbg !445
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !446
  %0 = load i8, i8* %full, align 1, !dbg !446
  %tobool = trunc i8 %0 to i1, !dbg !446
  %lnot = xor i1 %tobool, true, !dbg !447
  ret i1 %lnot, !dbg !448
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiED2Ev(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !449, metadata !293), !dbg !450
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  ret void, !dbg !451
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiED0Ev(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !452, metadata !293), !dbg !453
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  call void @_ZN4FifoIiED2Ev(%class.Fifo* %this1) #3, !dbg !454
  %0 = bitcast %class.Fifo* %this1 to i8*, !dbg !454
  call void @_ZdlPv(i8* %0) #8, !dbg !454
  ret void, !dbg !455
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE8enq__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !456, metadata !293), !dbg !457
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !458
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !458
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 9, !dbg !458
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !458
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !458
  ret i1 %call, !dbg !458
}

declare void @__cxa_pure_virtual()

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE8deq__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !459, metadata !293), !dbg !460
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !461
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !461
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 8, !dbg !461
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !461
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !461
  ret i1 %call, !dbg !461
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE10first__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !462, metadata !293), !dbg !463
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !464
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !464
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 8, !dbg !464
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !464
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !464
  ret i1 %call, !dbg !464
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #5

; Function Attrs: inlinehint nounwind
define linkonce_odr void @_ZN4RuleC2Ev(%class.Rule* %this) unnamed_addr #6 comdat align 2 {
entry:
  %this.addr = alloca %class.Rule*, align 8
  store %class.Rule* %this, %class.Rule** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Rule** %this.addr, metadata !465, metadata !293), !dbg !466
  %this1 = load %class.Rule*, %class.Rule** %this.addr
  %0 = bitcast %class.Rule* %this1 to i32 (...)***, !dbg !467
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTV4Rule, i64 0, i64 2) to i32 (...)**), i32 (...)*** %0, !dbg !467
  ret void, !dbg !467
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN6Module7addRuleEP4Rule(%class.Module* %this, %class.Rule* %rule) #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Module*, align 8
  %rule.addr = alloca %class.Rule*, align 8
  store %class.Module* %this, %class.Module** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Module** %this.addr, metadata !468, metadata !293), !dbg !469
  store %class.Rule* %rule, %class.Rule** %rule.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Rule** %rule.addr, metadata !470, metadata !293), !dbg !471
  %this1 = load %class.Module*, %class.Module** %this.addr
  %rfirst = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !472
  %rfirst2 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !473
  %0 = load %class.Rule*, %class.Rule** %rfirst2, align 8, !dbg !473
  %1 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !474
  %2 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !475
  %next = getelementptr inbounds %class.Rule, %class.Rule* %2, i32 0, i32 1, !dbg !476
  %3 = bitcast %class.Rule** %next to i8**, !dbg !477
  %add.ptr = getelementptr inbounds i8*, i8** %3, i64 -1, !dbg !478
  %4 = load i8*, i8** %add.ptr, align 8, !dbg !479
  %5 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !480
  %next3 = getelementptr inbounds %class.Rule, %class.Rule* %5, i32 0, i32 1, !dbg !481
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__FUNCTION__._ZN6Module7addRuleEP4Rule, i32 0, i32 0), %class.Rule** %rfirst, %class.Rule* %0, %class.Module* %this1, %class.Rule* %1, i8* %4, %class.Rule** %next3), !dbg !482
  %rfirst4 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !483
  %6 = load %class.Rule*, %class.Rule** %rfirst4, align 8, !dbg !483
  %7 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !484
  %next5 = getelementptr inbounds %class.Rule, %class.Rule* %7, i32 0, i32 1, !dbg !485
  store %class.Rule* %6, %class.Rule** %next5, align 8, !dbg !486
  %8 = load %class.Rule*, %class.Rule** %rule.addr, align 8, !dbg !487
  %rfirst6 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !488
  store %class.Rule* %8, %class.Rule** %rfirst6, align 8, !dbg !489
  ret void, !dbg !490
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZZN4EchoC1EP14EchoIndicationEN7respond3RDYEv(%class.respond* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.respond*, align 8
  store %class.respond* %this, %class.respond** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.respond** %this.addr, metadata !491, metadata !293), !dbg !492
  %this1 = load %class.respond*, %class.respond** %this.addr
  ret i1 true, !dbg !493
}

; Function Attrs: nounwind
define linkonce_odr void @_ZZN4EchoC1EP14EchoIndicationEN7respond3ENAEv(%class.respond* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.respond*, align 8
  store %class.respond* %this, %class.respond** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.respond** %this.addr, metadata !494, metadata !293), !dbg !495
  %this1 = load %class.respond*, %class.respond** %this.addr
  %module = getelementptr inbounds %class.respond, %class.respond* %this1, i32 0, i32 1, !dbg !496
  %0 = load %class.Echo*, %class.Echo** %module, align 8, !dbg !496
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %0, i32 0, i32 1, !dbg !496
  %1 = load %class.Fifo*, %class.Fifo** %fifo, align 8, !dbg !496
  %2 = bitcast %class.Fifo* %1 to void (%class.Fifo*)***, !dbg !496
  %vtable = load void (%class.Fifo*)**, void (%class.Fifo*)*** %2, !dbg !496
  %vfn = getelementptr inbounds void (%class.Fifo*)*, void (%class.Fifo*)** %vtable, i64 5, !dbg !496
  %3 = load void (%class.Fifo*)*, void (%class.Fifo*)** %vfn, !dbg !496
  call void %3(%class.Fifo* %1), !dbg !496
  %module2 = getelementptr inbounds %class.respond, %class.respond* %this1, i32 0, i32 1, !dbg !496
  %4 = load %class.Echo*, %class.Echo** %module2, align 8, !dbg !496
  %ind = getelementptr inbounds %class.Echo, %class.Echo* %4, i32 0, i32 2, !dbg !496
  %5 = load %class.EchoIndication*, %class.EchoIndication** %ind, align 8, !dbg !496
  %module3 = getelementptr inbounds %class.respond, %class.respond* %this1, i32 0, i32 1, !dbg !496
  %6 = load %class.Echo*, %class.Echo** %module3, align 8, !dbg !496
  %fifo4 = getelementptr inbounds %class.Echo, %class.Echo* %6, i32 0, i32 1, !dbg !496
  %7 = load %class.Fifo*, %class.Fifo** %fifo4, align 8, !dbg !496
  %8 = bitcast %class.Fifo* %7 to i32 (%class.Fifo*)***, !dbg !496
  %vtable5 = load i32 (%class.Fifo*)**, i32 (%class.Fifo*)*** %8, !dbg !496
  %vfn6 = getelementptr inbounds i32 (%class.Fifo*)*, i32 (%class.Fifo*)** %vtable5, i64 7, !dbg !496
  %9 = load i32 (%class.Fifo*)*, i32 (%class.Fifo*)** %vfn6, !dbg !496
  %call = call i32 %9(%class.Fifo* %7), !dbg !496
  call void @_ZN14EchoIndication4echoEi(i32 %call), !dbg !496
  ret void, !dbg !496
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZZN8EchoTestC1EvEN5drive3RDYEv(%class.drive* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.drive*, align 8
  store %class.drive* %this, %class.drive** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.drive** %this.addr, metadata !497, metadata !293), !dbg !498
  %this1 = load %class.drive*, %class.drive** %this.addr
  ret i1 true, !dbg !499
}

; Function Attrs: nounwind
define linkonce_odr void @_ZZN8EchoTestC1EvEN5drive3ENAEv(%class.drive* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.drive*, align 8
  store %class.drive* %this, %class.drive** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.drive** %this.addr, metadata !500, metadata !293), !dbg !501
  %this1 = load %class.drive*, %class.drive** %this.addr
  %module = getelementptr inbounds %class.drive, %class.drive* %this1, i32 0, i32 1, !dbg !502
  %0 = load %class.EchoTest*, %class.EchoTest** %module, align 8, !dbg !502
  %echo = getelementptr inbounds %class.EchoTest, %class.EchoTest* %0, i32 0, i32 1, !dbg !502
  %1 = load %class.Echo*, %class.Echo** %echo, align 8, !dbg !502
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %1, i32 0, i32 1, !dbg !502
  %2 = load %class.Fifo*, %class.Fifo** %fifo, align 8, !dbg !502
  %3 = bitcast %class.Fifo* %2 to void (%class.Fifo*, i32)***, !dbg !502
  %vtable = load void (%class.Fifo*, i32)**, void (%class.Fifo*, i32)*** %3, !dbg !502
  %vfn = getelementptr inbounds void (%class.Fifo*, i32)*, void (%class.Fifo*, i32)** %vtable, i64 3, !dbg !502
  %4 = load void (%class.Fifo*, i32)*, void (%class.Fifo*, i32)** %vfn, !dbg !502
  call void %4(%class.Fifo* %2, i32 22), !dbg !502
  ret void, !dbg !502
}

; Function Attrs: nounwind
define internal void @_GLOBAL__sub_I_echo.cpp() #0 section ".text.startup" {
entry:
  call void @__cxx_global_var_init(), !dbg !503
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
!llvm.module.flags = !{!289, !290}
!llvm.ident = !{!291}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !227, globals: !271, imports: !277)
!1 = !DIFile(filename: "echo.cpp", directory: "/home/jca/s/git/atomicc/examples/echo")
!2 = !{}
!3 = !{!4, !59, !60, !71, !82, !104, !119, !134, !166, !182, !183, !198, !226}
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
!71 = !DICompositeType(tag: DW_TAG_class_type, name: "EchoTest", file: !1, line: 67, size: 320, align: 64, elements: !72, identifier: "_ZTS8EchoTest")
!72 = !{!73, !74, !76, !77, !81}
!73 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS8EchoTest", baseType: !"_ZTS6Module", flags: DIFlagPublic)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !"_ZTS8EchoTest", file: !1, line: 69, baseType: !75, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Echo", size: 64, align: 64)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !"_ZTS8EchoTest", file: !1, line: 70, baseType: !65, size: 32, align: 32, offset: 256, flags: DIFlagPublic)
!77 = !DISubprogram(name: "EchoTest", scope: !"_ZTS8EchoTest", file: !1, line: 72, type: !78, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!78 = !DISubroutineType(types: !79)
!79 = !{null, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS8EchoTest", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!81 = !DISubprogram(name: "~EchoTest", scope: !"_ZTS8EchoTest", file: !1, line: 78, type: !78, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!82 = !DICompositeType(tag: DW_TAG_class_type, name: "Module", file: !83, line: 51, size: 192, align: 64, elements: !84, identifier: "_ZTS6Module")
!83 = !DIFile(filename: "../../cpp/atomicc.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!84 = !{!85, !87, !89, !93, !94, !98, !101}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "rfirst", scope: !"_ZTS6Module", file: !83, line: 77, baseType: !86, size: 64, align: 64, flags: DIFlagPublic)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Rule", size: 64, align: 64)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !"_ZTS6Module", file: !83, line: 78, baseType: !88, size: 64, align: 64, offset: 64, flags: DIFlagPublic)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !"_ZTS6Module", file: !83, line: 80, baseType: !90, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !91, line: 62, baseType: !92)
!91 = !DIFile(filename: "/scratch/jca/git/llvm/build/Debug+Asserts/bin/../lib/clang/3.7.0/include/stddef.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!92 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "first", scope: !"_ZTS6Module", file: !83, line: 81, baseType: !88, flags: DIFlagPublic | DIFlagStaticMember)
!94 = !DISubprogram(name: "Module", scope: !"_ZTS6Module", file: !83, line: 54, type: !95, isLocal: false, isDefinition: false, scopeLine: 54, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !97, !90}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!98 = !DISubprogram(name: "addRule", linkageName: "_ZN6Module7addRuleEP4Rule", scope: !"_ZTS6Module", file: !83, line: 61, type: !99, isLocal: false, isDefinition: false, scopeLine: 61, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{null, !97, !86}
!101 = !DISubprogram(name: "run", linkageName: "_ZN6Module3runEv", scope: !"_ZTS6Module", file: !83, line: 66, type: !102, isLocal: false, isDefinition: false, scopeLine: 66, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!102 = !DISubroutineType(types: !103)
!103 = !{null, !97}
!104 = !DICompositeType(tag: DW_TAG_class_type, name: "Rule", file: !83, line: 37, size: 128, align: 64, elements: !105, vtableHolder: !"_ZTS4Rule", identifier: "_ZTS4Rule")
!105 = !{!106, !111, !112, !116}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$Rule", scope: !83, file: !83, baseType: !107, size: 64, flags: DIFlagArtificial)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !109, size: 64)
!109 = !DISubroutineType(types: !110)
!110 = !{!65}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !"_ZTS4Rule", file: !83, line: 41, baseType: !86, size: 64, align: 64, offset: 64, flags: DIFlagPublic)
!112 = !DISubprogram(name: "RDY", linkageName: "_ZN4Rule3RDYEv", scope: !"_ZTS4Rule", file: !83, line: 39, type: !113, isLocal: false, isDefinition: false, scopeLine: 39, containingType: !"_ZTS4Rule", virtuality: DW_VIRTUALITY_pure_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!113 = !DISubroutineType(types: !114)
!114 = !{!53, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Rule", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!116 = !DISubprogram(name: "ENA", linkageName: "_ZN4Rule3ENAEv", scope: !"_ZTS4Rule", file: !83, line: 40, type: !117, isLocal: false, isDefinition: false, scopeLine: 40, containingType: !"_ZTS4Rule", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!117 = !DISubroutineType(types: !118)
!118 = !{null, !115}
!119 = !DICompositeType(tag: DW_TAG_class_type, name: "Echo", file: !1, line: 39, size: 384, align: 64, elements: !120, identifier: "_ZTS4Echo")
!120 = !{!121, !122, !124, !126, !127, !131}
!121 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS4Echo", baseType: !"_ZTS6Module", flags: DIFlagPublic)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "fifo", scope: !"_ZTS4Echo", file: !1, line: 41, baseType: !123, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4FifoIiE", size: 64, align: 64)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "ind", scope: !"_ZTS4Echo", file: !1, line: 42, baseType: !125, size: 64, align: 64, offset: 256, flags: DIFlagPublic)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS14EchoIndication", size: 64, align: 64)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "pipetemp", scope: !"_ZTS4Echo", file: !1, line: 43, baseType: !65, size: 32, align: 32, offset: 320, flags: DIFlagPublic)
!127 = !DISubprogram(name: "Echo", scope: !"_ZTS4Echo", file: !1, line: 45, type: !128, isLocal: false, isDefinition: false, scopeLine: 45, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!128 = !DISubroutineType(types: !129)
!129 = !{null, !130, !125}
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Echo", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!131 = !DISubprogram(name: "~Echo", scope: !"_ZTS4Echo", file: !1, line: 54, type: !132, isLocal: false, isDefinition: false, scopeLine: 54, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!132 = !DISubroutineType(types: !133)
!133 = !{null, !130}
!134 = !DICompositeType(tag: DW_TAG_class_type, name: "Fifo<int>", file: !135, line: 8, size: 256, align: 64, elements: !136, vtableHolder: !"_ZTS4FifoIiE", templateParams: !164, identifier: "_ZTS4FifoIiE")
!135 = !DIFile(filename: "../../cpp/fifo.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!136 = !{!137, !138, !139, !143, !146, !149, !152, !153, !154, !155, !158, !163}
!137 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS4FifoIiE", baseType: !"_ZTS6Module", offset: 64, flags: DIFlagPublic)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$Fifo", scope: !135, file: !135, baseType: !107, size: 64, flags: DIFlagArtificial)
!139 = !DISubprogram(name: "Fifo", scope: !"_ZTS4FifoIiE", file: !135, line: 10, type: !140, isLocal: false, isDefinition: false, scopeLine: 10, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !142, !90}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4FifoIiE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!143 = !DISubprogram(name: "~Fifo", scope: !"_ZTS4FifoIiE", file: !135, line: 11, type: !144, isLocal: false, isDefinition: false, scopeLine: 11, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!144 = !DISubroutineType(types: !145)
!145 = !{null, !142}
!146 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN4FifoIiE8enq__RDYEv", scope: !"_ZTS4FifoIiE", file: !135, line: 12, type: !147, isLocal: false, isDefinition: false, scopeLine: 12, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!53, !142}
!149 = !DISubprogram(name: "enq", linkageName: "_ZN4FifoIiE3enqEi", scope: !"_ZTS4FifoIiE", file: !135, line: 12, type: !150, isLocal: false, isDefinition: false, scopeLine: 12, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 3, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!150 = !DISubroutineType(types: !151)
!151 = !{null, !142, !65}
!152 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN4FifoIiE8deq__RDYEv", scope: !"_ZTS4FifoIiE", file: !135, line: 13, type: !147, isLocal: false, isDefinition: false, scopeLine: 13, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 4, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!153 = !DISubprogram(name: "deq", linkageName: "_ZN4FifoIiE3deqEv", scope: !"_ZTS4FifoIiE", file: !135, line: 13, type: !144, isLocal: false, isDefinition: false, scopeLine: 13, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 5, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!154 = !DISubprogram(name: "first__RDY", linkageName: "_ZN4FifoIiE10first__RDYEv", scope: !"_ZTS4FifoIiE", file: !135, line: 14, type: !147, isLocal: false, isDefinition: false, scopeLine: 14, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!155 = !DISubprogram(name: "first", linkageName: "_ZN4FifoIiE5firstEv", scope: !"_ZTS4FifoIiE", file: !135, line: 14, type: !156, isLocal: false, isDefinition: false, scopeLine: 14, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 7, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!156 = !DISubroutineType(types: !157)
!157 = !{!65, !142}
!158 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK4FifoIiE8notEmptyEv", scope: !"_ZTS4FifoIiE", file: !135, line: 15, type: !159, isLocal: false, isDefinition: false, scopeLine: 15, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 8, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!159 = !DISubroutineType(types: !160)
!160 = !{!53, !161}
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!162 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTS4FifoIiE")
!163 = !DISubprogram(name: "notFull", linkageName: "_ZNK4FifoIiE7notFullEv", scope: !"_ZTS4FifoIiE", file: !135, line: 16, type: !159, isLocal: false, isDefinition: false, scopeLine: 16, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 9, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!164 = !{!165}
!165 = !DITemplateTypeParameter(name: "T", type: !65)
!166 = !DICompositeType(tag: DW_TAG_class_type, name: "drive", scope: !167, file: !1, line: 74, size: 192, align: 64, elements: !168, vtableHolder: !"_ZTS4Rule", identifier: "_ZTSZN8EchoTestC1EvE5drive")
!167 = !DISubprogram(name: "EchoTest", linkageName: "_ZN8EchoTestC2Ev", scope: !"_ZTS8EchoTest", file: !1, line: 72, type: !78, isLocal: false, isDefinition: true, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoTest*)* @_ZN8EchoTestC2Ev, declaration: !77, variables: !2)
!168 = !{!169, !170, !172, !176, !179}
!169 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTSZN8EchoTestC1EvE5drive", baseType: !"_ZTS4Rule", flags: DIFlagPublic)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "module", scope: !"_ZTSZN8EchoTestC1EvE5drive", file: !1, line: 74, baseType: !171, size: 64, align: 64, offset: 128)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS8EchoTest", size: 64, align: 64)
!172 = !DISubprogram(name: "RDY", scope: !"_ZTSZN8EchoTestC1EvE5drive", file: !1, line: 74, type: !173, isLocal: false, isDefinition: false, scopeLine: 74, containingType: !"_ZTSZN8EchoTestC1EvE5drive", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{!53, !175}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSZN8EchoTestC1EvE5drive", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!176 = !DISubprogram(name: "ENA", scope: !"_ZTSZN8EchoTestC1EvE5drive", file: !1, line: 74, type: !177, isLocal: false, isDefinition: false, scopeLine: 74, containingType: !"_ZTSZN8EchoTestC1EvE5drive", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!177 = !DISubroutineType(types: !178)
!178 = !{null, !175}
!179 = !DISubprogram(name: "drive", scope: !"_ZTSZN8EchoTestC1EvE5drive", file: !1, line: 74, type: !180, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{null, !175, !171}
!182 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!183 = !DICompositeType(tag: DW_TAG_class_type, name: "respond", scope: !184, file: !1, line: 47, size: 192, align: 64, elements: !185, vtableHolder: !"_ZTS4Rule", identifier: "_ZTSZN4EchoC1EP14EchoIndicationE7respond")
!184 = !DISubprogram(name: "Echo", linkageName: "_ZN4EchoC2EP14EchoIndication", scope: !"_ZTS4Echo", file: !1, line: 45, type: !128, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Echo*, %class.EchoIndication*)* @_ZN4EchoC2EP14EchoIndication, declaration: !127, variables: !2)
!185 = !{!186, !187, !188, !192, !195}
!186 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", baseType: !"_ZTS4Rule", flags: DIFlagPublic)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "module", scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", file: !1, line: 47, baseType: !75, size: 64, align: 64, offset: 128)
!188 = !DISubprogram(name: "RDY", scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", file: !1, line: 47, type: !189, isLocal: false, isDefinition: false, scopeLine: 47, containingType: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!53, !191}
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!192 = !DISubprogram(name: "ENA", scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", file: !1, line: 47, type: !193, isLocal: false, isDefinition: false, scopeLine: 47, containingType: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !191}
!195 = !DISubprogram(name: "respond", scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", file: !1, line: 47, type: !196, isLocal: false, isDefinition: false, scopeLine: 47, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!196 = !DISubroutineType(types: !197)
!197 = !{null, !191, !75}
!198 = !DICompositeType(tag: DW_TAG_class_type, name: "Fifo1<int>", file: !135, line: 20, size: 320, align: 64, elements: !199, vtableHolder: !"_ZTS4FifoIiE", templateParams: !164, identifier: "_ZTS5Fifo1IiE")
!199 = !{!200, !201, !202, !203, !207, !210, !211, !214, !215, !218, !219, !220, !225}
!200 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS5Fifo1IiE", baseType: !"_ZTS4FifoIiE", flags: DIFlagPublic)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "element", scope: !"_ZTS5Fifo1IiE", file: !135, line: 23, baseType: !65, size: 32, align: 32, offset: 256, flags: DIFlagPublic)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "full", scope: !"_ZTS5Fifo1IiE", file: !135, line: 24, baseType: !53, size: 8, align: 8, offset: 288, flags: DIFlagPublic)
!203 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN5Fifo1IiE8enq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 26, type: !204, isLocal: false, isDefinition: false, scopeLine: 26, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!204 = !DISubroutineType(types: !205)
!205 = !{!53, !206}
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS5Fifo1IiE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!207 = !DISubprogram(name: "enq", linkageName: "_ZN5Fifo1IiE3enqEi", scope: !"_ZTS5Fifo1IiE", file: !135, line: 26, type: !208, isLocal: false, isDefinition: false, scopeLine: 26, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 3, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!208 = !DISubroutineType(types: !209)
!209 = !{null, !206, !65}
!210 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN5Fifo1IiE8deq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 30, type: !204, isLocal: false, isDefinition: false, scopeLine: 30, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 4, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!211 = !DISubprogram(name: "deq", linkageName: "_ZN5Fifo1IiE3deqEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 30, type: !212, isLocal: false, isDefinition: false, scopeLine: 30, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 5, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!212 = !DISubroutineType(types: !213)
!213 = !{null, !206}
!214 = !DISubprogram(name: "first__RDY", linkageName: "_ZN5Fifo1IiE10first__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 33, type: !204, isLocal: false, isDefinition: false, scopeLine: 33, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!215 = !DISubprogram(name: "first", linkageName: "_ZN5Fifo1IiE5firstEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 33, type: !216, isLocal: false, isDefinition: false, scopeLine: 33, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 7, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!216 = !DISubroutineType(types: !217)
!217 = !{!65, !206}
!218 = !DISubprogram(name: "Fifo1", scope: !"_ZTS5Fifo1IiE", file: !135, line: 36, type: !212, isLocal: false, isDefinition: false, scopeLine: 36, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!219 = !DISubprogram(name: "~Fifo1", scope: !"_ZTS5Fifo1IiE", file: !135, line: 40, type: !212, isLocal: false, isDefinition: false, scopeLine: 40, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!220 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK5Fifo1IiE8notEmptyEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 41, type: !221, isLocal: false, isDefinition: false, scopeLine: 41, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 8, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!221 = !DISubroutineType(types: !222)
!222 = !{!53, !223}
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!224 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTS5Fifo1IiE")
!225 = !DISubprogram(name: "notFull", linkageName: "_ZNK5Fifo1IiE7notFullEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 42, type: !221, isLocal: false, isDefinition: false, scopeLine: 42, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 9, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!227 = !{!228, !229, !232, !233, !167, !240, !241, !184, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !262, !263, !264, !265, !266, !267, !268, !269}
!228 = !DISubprogram(name: "echo", linkageName: "_ZN14EchoIndication4echoEi", scope: !"_ZTS14EchoIndication", file: !1, line: 61, type: !63, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, function: void (i32)* @_ZN14EchoIndication4echoEi, declaration: !62, variables: !2)
!229 = !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, line: 81, type: !230, isLocal: true, isDefinition: true, scopeLine: 81, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @__cxx_global_var_init, variables: !2)
!230 = !DISubroutineType(types: !231)
!231 = !{null}
!232 = !DISubprogram(name: "__dtor_echoTest", scope: !1, file: !1, line: 81, type: !230, isLocal: true, isDefinition: true, scopeLine: 81, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @__dtor_echoTest, variables: !2)
!233 = !DISubprogram(name: "main", scope: !1, file: !1, line: 83, type: !234, isLocal: false, isDefinition: true, scopeLine: 84, flags: DIFlagPrototyped, isOptimized: false, function: i32 (i32, i8**)* @main, variables: !2)
!234 = !DISubroutineType(types: !235)
!235 = !{!65, !65, !236}
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64, align: 64)
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64, align: 64)
!238 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !239)
!239 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!240 = !DISubprogram(name: "Module", linkageName: "_ZN6ModuleC2Em", scope: !"_ZTS6Module", file: !83, line: 54, type: !95, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Module*, i64)* @_ZN6ModuleC2Em, declaration: !94, variables: !2)
!241 = !DISubprogram(name: "EchoIndication", linkageName: "_ZN14EchoIndicationC2Ev", scope: !"_ZTS14EchoIndication", file: !1, line: 35, type: !67, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoIndication*)* @_ZN14EchoIndicationC2Ev, declaration: !66, variables: !2)
!242 = !DISubprogram(name: "Fifo1", linkageName: "_ZN5Fifo1IiEC2Ev", scope: !"_ZTS5Fifo1IiE", file: !135, line: 36, type: !212, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiEC2Ev, declaration: !218, variables: !2)
!243 = !DISubprogram(name: "Fifo", linkageName: "_ZN4FifoIiEC2Em", scope: !"_ZTS4FifoIiE", file: !135, line: 10, type: !140, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*, i64)* @_ZN4FifoIiEC2Em, declaration: !139, variables: !2)
!244 = !DISubprogram(name: "~Fifo", linkageName: "_ZN4FifoIiED2Ev", scope: !"_ZTS4FifoIiE", file: !135, line: 11, type: !144, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*)* @_ZN4FifoIiED2Ev, declaration: !143, variables: !2)
!245 = !DISubprogram(name: "~Fifo", linkageName: "_ZN4FifoIiED0Ev", scope: !"_ZTS4FifoIiE", file: !135, line: 11, type: !144, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*)* @_ZN4FifoIiED0Ev, declaration: !143, variables: !2)
!246 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN4FifoIiE8enq__RDYEv", scope: !"_ZTS4FifoIiE", file: !135, line: 12, type: !147, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE8enq__RDYEv, declaration: !146, variables: !2)
!247 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN4FifoIiE8deq__RDYEv", scope: !"_ZTS4FifoIiE", file: !135, line: 13, type: !147, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE8deq__RDYEv, declaration: !152, variables: !2)
!248 = !DISubprogram(name: "first__RDY", linkageName: "_ZN4FifoIiE10first__RDYEv", scope: !"_ZTS4FifoIiE", file: !135, line: 14, type: !147, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE10first__RDYEv, declaration: !154, variables: !2)
!249 = !DISubprogram(name: "~Fifo1", linkageName: "_ZN5Fifo1IiED2Ev", scope: !"_ZTS5Fifo1IiE", file: !135, line: 40, type: !212, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiED2Ev, declaration: !219, variables: !2)
!250 = !DISubprogram(name: "~Fifo1", linkageName: "_ZN5Fifo1IiED0Ev", scope: !"_ZTS5Fifo1IiE", file: !135, line: 40, type: !212, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiED0Ev, declaration: !219, variables: !2)
!251 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN5Fifo1IiE8enq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 26, type: !204, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8enq__RDYEv, declaration: !203, variables: !2)
!252 = !DISubprogram(name: "enq", linkageName: "_ZN5Fifo1IiE3enqEi", scope: !"_ZTS5Fifo1IiE", file: !135, line: 26, type: !208, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*, i32)* @_ZN5Fifo1IiE3enqEi, declaration: !207, variables: !2)
!253 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN5Fifo1IiE8deq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 30, type: !204, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8deq__RDYEv, declaration: !210, variables: !2)
!254 = !DISubprogram(name: "deq", linkageName: "_ZN5Fifo1IiE3deqEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 30, type: !212, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiE3deqEv, declaration: !211, variables: !2)
!255 = !DISubprogram(name: "first__RDY", linkageName: "_ZN5Fifo1IiE10first__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 33, type: !204, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE10first__RDYEv, declaration: !214, variables: !2)
!256 = !DISubprogram(name: "first", linkageName: "_ZN5Fifo1IiE5firstEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 33, type: !216, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, function: i32 (%class.Fifo1*)* @_ZN5Fifo1IiE5firstEv, declaration: !215, variables: !2)
!257 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK5Fifo1IiE8notEmptyEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 41, type: !221, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE8notEmptyEv, declaration: !220, variables: !2)
!258 = !DISubprogram(name: "notFull", linkageName: "_ZNK5Fifo1IiE7notFullEv", scope: !"_ZTS5Fifo1IiE", file: !135, line: 42, type: !221, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE7notFullEv, declaration: !225, variables: !2)
!259 = !DISubprogram(name: "respond", linkageName: "_ZZN4EchoC1EP14EchoIndicationEN7respondC2EPS_", scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", file: !1, line: 47, type: !196, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.respond*, %class.Echo*)* @_ZZN4EchoC1EP14EchoIndicationEN7respondC2EPS_, declaration: !195, variables: !2)
!260 = !DISubprogram(name: "Rule", linkageName: "_ZN4RuleC2Ev", scope: !"_ZTS4Rule", file: !83, line: 37, type: !117, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, function: void (%class.Rule*)* @_ZN4RuleC2Ev, declaration: !261, variables: !2)
!261 = !DISubprogram(name: "Rule", scope: !"_ZTS4Rule", type: !117, isLocal: false, isDefinition: false, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!262 = !DISubprogram(name: "addRule", linkageName: "_ZN6Module7addRuleEP4Rule", scope: !"_ZTS6Module", file: !83, line: 61, type: !99, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Module*, %class.Rule*)* @_ZN6Module7addRuleEP4Rule, declaration: !98, variables: !2)
!263 = !DISubprogram(name: "RDY", linkageName: "_ZZN4EchoC1EP14EchoIndicationEN7respond3RDYEv", scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", file: !1, line: 47, type: !189, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.respond*)* @_ZZN4EchoC1EP14EchoIndicationEN7respond3RDYEv, declaration: !188, variables: !2)
!264 = !DISubprogram(name: "ENA", linkageName: "_ZZN4EchoC1EP14EchoIndicationEN7respond3ENAEv", scope: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", file: !1, line: 47, type: !193, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.respond*)* @_ZZN4EchoC1EP14EchoIndicationEN7respond3ENAEv, declaration: !192, variables: !2)
!265 = !DISubprogram(name: "drive", linkageName: "_ZZN8EchoTestC1EvEN5driveC2EPS_", scope: !"_ZTSZN8EchoTestC1EvE5drive", file: !1, line: 74, type: !180, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.drive*, %class.EchoTest*)* @_ZZN8EchoTestC1EvEN5driveC2EPS_, declaration: !179, variables: !2)
!266 = !DISubprogram(name: "RDY", linkageName: "_ZZN8EchoTestC1EvEN5drive3RDYEv", scope: !"_ZTSZN8EchoTestC1EvE5drive", file: !1, line: 74, type: !173, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.drive*)* @_ZZN8EchoTestC1EvEN5drive3RDYEv, declaration: !172, variables: !2)
!267 = !DISubprogram(name: "ENA", linkageName: "_ZZN8EchoTestC1EvEN5drive3ENAEv", scope: !"_ZTSZN8EchoTestC1EvE5drive", file: !1, line: 74, type: !177, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.drive*)* @_ZZN8EchoTestC1EvEN5drive3ENAEv, declaration: !176, variables: !2)
!268 = !DISubprogram(name: "~EchoTest", linkageName: "_ZN8EchoTestD2Ev", scope: !"_ZTS8EchoTest", file: !1, line: 78, type: !78, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoTest*)* @_ZN8EchoTestD2Ev, declaration: !81, variables: !2)
!269 = !DISubprogram(linkageName: "_GLOBAL__sub_I_echo.cpp", scope: !1, file: !1, type: !270, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, function: void ()* @_GLOBAL__sub_I_echo.cpp, variables: !2)
!270 = !DISubroutineType(types: !2)
!271 = !{!272, !273, !275}
!272 = !DIGlobalVariable(name: "echoTest", scope: !0, file: !1, line: 81, type: !"_ZTS8EchoTest", isLocal: false, isDefinition: true, variable: %class.EchoTest* @echoTest)
!273 = !DIGlobalVariable(name: "driveRule", scope: !167, file: !1, line: 74, type: !274, isLocal: false, isDefinition: true, variable: %class.drive** @_ZZN8EchoTestC1EvE9driveRule)
!274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSZN8EchoTestC1EvE5drive", size: 64, align: 64)
!275 = !DIGlobalVariable(name: "respondRule", scope: !184, file: !1, line: 47, type: !276, isLocal: false, isDefinition: true, variable: %class.respond** @_ZZN4EchoC1EP14EchoIndicationE11respondRule)
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSZN4EchoC1EP14EchoIndicationE7respond", size: 64, align: 64)
!277 = !{!278, !282, !283, !287}
!278 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !279, entity: !281, line: 56)
!279 = !DINamespace(name: "__gnu_debug", scope: null, file: !280, line: 54)
!280 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!281 = !DINamespace(name: "__debug", scope: !7, file: !280, line: 48)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !"_ZTSNSt15__exception_ptr13exception_ptrE", line: 58)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !284, entity: !286, line: 44)
!284 = !DINamespace(name: "__gnu_cxx", scope: null, file: !285, line: 68)
!285 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !7, file: !8, line: 186, baseType: !92)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !284, entity: !288, line: 45)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !7, file: !8, line: 187, baseType: !182)
!289 = !{i32 2, !"Dwarf Version", i32 4}
!290 = !{i32 2, !"Debug Info Version", i32 3}
!291 = !{!"clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)"}
!292 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "v", arg: 1, scope: !228, file: !1, line: 61, type: !65)
!293 = !DIExpression()
!294 = !DILocation(line: 61, column: 31, scope: !228)
!295 = !DILocation(line: 63, column: 35, scope: !228)
!296 = !DILocation(line: 63, column: 5, scope: !228)
!297 = !DILocation(line: 64, column: 23, scope: !228)
!298 = !DILocation(line: 65, column: 1, scope: !228)
!299 = !DILocation(line: 81, column: 10, scope: !229)
!300 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !167, type: !171, flags: DIFlagArtificial | DIFlagObjectPointer)
!301 = !DILocation(line: 0, scope: !167)
!302 = !DILocation(line: 72, column: 80, scope: !167)
!303 = !DILocation(line: 72, column: 15, scope: !167)
!304 = !DILocation(line: 72, column: 37, scope: !167)
!305 = !DILocation(line: 72, column: 42, scope: !167)
!306 = !DILocation(line: 72, column: 51, scope: !167)
!307 = !DILocation(line: 72, column: 55, scope: !167)
!308 = !DILocation(line: 72, column: 46, scope: !167)
!309 = !DILocation(line: 72, column: 75, scope: !167)
!310 = !DILocation(line: 73, column: 7, scope: !311)
!311 = distinct !DILexicalBlock(scope: !167, file: !1, line: 72, column: 80)
!312 = !DILocation(line: 74, column: 7, scope: !311)
!313 = !DILocation(line: 74, column: 7, scope: !314)
!314 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 1)
!315 = !DILocation(line: 74, column: 7, scope: !316)
!316 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 2)
!317 = !DILocation(line: 77, column: 3, scope: !167)
!318 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !268, type: !171, flags: DIFlagArtificial | DIFlagObjectPointer)
!319 = !DILocation(line: 0, scope: !268)
!320 = !DILocation(line: 78, column: 16, scope: !268)
!321 = !DILocation(line: 81, column: 10, scope: !232)
!322 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "argc", arg: 1, scope: !233, file: !1, line: 83, type: !65)
!323 = !DILocation(line: 83, column: 14, scope: !233)
!324 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "argv", arg: 2, scope: !233, file: !1, line: 83, type: !236)
!325 = !DILocation(line: 83, column: 32, scope: !233)
!326 = !DILocation(line: 85, column: 59, scope: !233)
!327 = !DILocation(line: 85, column: 3, scope: !233)
!328 = !DILocation(line: 86, column: 7, scope: !329)
!329 = distinct !DILexicalBlock(scope: !233, file: !1, line: 86, column: 7)
!330 = !DILocation(line: 86, column: 12, scope: !329)
!331 = !DILocation(line: 86, column: 7, scope: !233)
!332 = !DILocation(line: 87, column: 7, scope: !329)
!333 = !DILocation(line: 88, column: 3, scope: !233)
!334 = !DILocation(line: 89, column: 3, scope: !233)
!335 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !240, type: !88, flags: DIFlagArtificial | DIFlagObjectPointer)
!336 = !DILocation(line: 0, scope: !240)
!337 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "size", arg: 2, scope: !240, file: !83, line: 54, type: !90)
!338 = !DILocation(line: 54, column: 17, scope: !240)
!339 = !DILocation(line: 54, column: 24, scope: !240)
!340 = !DILocation(line: 54, column: 38, scope: !240)
!341 = !DILocation(line: 54, column: 43, scope: !240)
!342 = !DILocation(line: 54, column: 51, scope: !240)
!343 = !DILocation(line: 54, column: 56, scope: !240)
!344 = !DILocation(line: 55, column: 96, scope: !345)
!345 = distinct !DILexicalBlock(scope: !240, file: !83, line: 54, column: 62)
!346 = !DILocation(line: 55, column: 115, scope: !345)
!347 = !DILocation(line: 55, column: 6, scope: !345)
!348 = !DILocation(line: 56, column: 12, scope: !345)
!349 = !DILocation(line: 60, column: 3, scope: !240)
!350 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !241, type: !125, flags: DIFlagArtificial | DIFlagObjectPointer)
!351 = !DILocation(line: 0, scope: !241)
!352 = !DILocation(line: 35, column: 21, scope: !241)
!353 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !184, type: !75, flags: DIFlagArtificial | DIFlagObjectPointer)
!354 = !DILocation(line: 0, scope: !184)
!355 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "ind", arg: 2, scope: !184, file: !1, line: 45, type: !125)
!356 = !DILocation(line: 45, column: 24, scope: !184)
!357 = !DILocation(line: 45, column: 86, scope: !184)
!358 = !DILocation(line: 45, column: 31, scope: !184)
!359 = !DILocation(line: 45, column: 53, scope: !184)
!360 = !DILocation(line: 45, column: 58, scope: !184)
!361 = !DILocation(line: 45, column: 62, scope: !184)
!362 = !DILocation(line: 45, column: 77, scope: !184)
!363 = !DILocation(line: 45, column: 81, scope: !184)
!364 = !DILocation(line: 46, column: 83, scope: !365)
!365 = distinct !DILexicalBlock(scope: !184, file: !1, line: 45, column: 86)
!366 = !DILocation(line: 46, column: 5, scope: !365)
!367 = !DILocation(line: 47, column: 5, scope: !365)
!368 = !DILocation(line: 47, column: 5, scope: !369)
!369 = !DILexicalBlockFile(scope: !365, file: !1, discriminator: 1)
!370 = !DILocation(line: 47, column: 5, scope: !371)
!371 = !DILexicalBlockFile(scope: !365, file: !1, discriminator: 2)
!372 = !DILocation(line: 53, column: 3, scope: !184)
!373 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !265, type: !274, flags: DIFlagArtificial | DIFlagObjectPointer)
!374 = !DILocation(line: 0, scope: !265)
!375 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "module", arg: 2, scope: !265, file: !1, line: 74, type: !171)
!376 = !DILocation(line: 74, column: 7, scope: !265)
!377 = !DILocation(line: 74, column: 7, scope: !378)
!378 = distinct !DILexicalBlock(scope: !265, file: !1, line: 74, column: 7)
!379 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !242, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS5Fifo1IiE", size: 64, align: 64)
!381 = !DILocation(line: 0, scope: !242)
!382 = !DILocation(line: 37, column: 17, scope: !242)
!383 = !DILocation(line: 36, column: 13, scope: !242)
!384 = !DILocation(line: 37, column: 5, scope: !242)
!385 = !DILocation(line: 38, column: 5, scope: !386)
!386 = distinct !DILexicalBlock(scope: !242, file: !135, line: 37, column: 17)
!387 = !DILocation(line: 39, column: 3, scope: !242)
!388 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !259, type: !276, flags: DIFlagArtificial | DIFlagObjectPointer)
!389 = !DILocation(line: 0, scope: !259)
!390 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "module", arg: 2, scope: !259, file: !1, line: 47, type: !75)
!391 = !DILocation(line: 47, column: 5, scope: !259)
!392 = !DILocation(line: 47, column: 5, scope: !393)
!393 = distinct !DILexicalBlock(scope: !259, file: !1, line: 47, column: 5)
!394 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !243, type: !123, flags: DIFlagArtificial | DIFlagObjectPointer)
!395 = !DILocation(line: 0, scope: !243)
!396 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "size", arg: 2, scope: !243, file: !135, line: 10, type: !90)
!397 = !DILocation(line: 10, column: 15, scope: !243)
!398 = !DILocation(line: 10, column: 35, scope: !243)
!399 = !DILocation(line: 10, column: 29, scope: !243)
!400 = !DILocation(line: 10, column: 22, scope: !243)
!401 = !DILocation(line: 10, column: 36, scope: !243)
!402 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !249, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!403 = !DILocation(line: 0, scope: !249)
!404 = !DILocation(line: 40, column: 13, scope: !405)
!405 = distinct !DILexicalBlock(scope: !249, file: !135, line: 40, column: 12)
!406 = !DILocation(line: 40, column: 13, scope: !249)
!407 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !250, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!408 = !DILocation(line: 0, scope: !250)
!409 = !DILocation(line: 40, column: 12, scope: !250)
!410 = !DILocation(line: 40, column: 13, scope: !250)
!411 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !251, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!412 = !DILocation(line: 0, scope: !251)
!413 = !DILocation(line: 26, column: 3, scope: !251)
!414 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !252, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!415 = !DILocation(line: 0, scope: !252)
!416 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "v", arg: 2, scope: !252, file: !135, line: 26, type: !65)
!417 = !DILocation(line: 26, column: 3, scope: !252)
!418 = !DILocation(line: 27, column: 17, scope: !252)
!419 = !DILocation(line: 27, column: 7, scope: !252)
!420 = !DILocation(line: 27, column: 15, scope: !252)
!421 = !DILocation(line: 28, column: 7, scope: !252)
!422 = !DILocation(line: 28, column: 12, scope: !252)
!423 = !DILocation(line: 29, column: 5, scope: !252)
!424 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !253, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!425 = !DILocation(line: 0, scope: !253)
!426 = !DILocation(line: 30, column: 3, scope: !253)
!427 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !254, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!428 = !DILocation(line: 0, scope: !254)
!429 = !DILocation(line: 31, column: 7, scope: !254)
!430 = !DILocation(line: 31, column: 12, scope: !254)
!431 = !DILocation(line: 32, column: 5, scope: !254)
!432 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !255, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!433 = !DILocation(line: 0, scope: !255)
!434 = !DILocation(line: 33, column: 3, scope: !255)
!435 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !256, type: !380, flags: DIFlagArtificial | DIFlagObjectPointer)
!436 = !DILocation(line: 0, scope: !256)
!437 = !DILocation(line: 34, column: 12, scope: !256)
!438 = !DILocation(line: 34, column: 5, scope: !256)
!439 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !257, type: !440, flags: DIFlagArtificial | DIFlagObjectPointer)
!440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64, align: 64)
!441 = !DILocation(line: 0, scope: !257)
!442 = !DILocation(line: 41, column: 34, scope: !257)
!443 = !DILocation(line: 41, column: 27, scope: !257)
!444 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !258, type: !440, flags: DIFlagArtificial | DIFlagObjectPointer)
!445 = !DILocation(line: 0, scope: !258)
!446 = !DILocation(line: 42, column: 34, scope: !258)
!447 = !DILocation(line: 42, column: 33, scope: !258)
!448 = !DILocation(line: 42, column: 26, scope: !258)
!449 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !244, type: !123, flags: DIFlagArtificial | DIFlagObjectPointer)
!450 = !DILocation(line: 0, scope: !244)
!451 = !DILocation(line: 11, column: 20, scope: !244)
!452 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !245, type: !123, flags: DIFlagArtificial | DIFlagObjectPointer)
!453 = !DILocation(line: 0, scope: !245)
!454 = !DILocation(line: 11, column: 19, scope: !245)
!455 = !DILocation(line: 11, column: 20, scope: !245)
!456 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !246, type: !123, flags: DIFlagArtificial | DIFlagObjectPointer)
!457 = !DILocation(line: 0, scope: !246)
!458 = !DILocation(line: 12, column: 3, scope: !246)
!459 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !247, type: !123, flags: DIFlagArtificial | DIFlagObjectPointer)
!460 = !DILocation(line: 0, scope: !247)
!461 = !DILocation(line: 13, column: 3, scope: !247)
!462 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !248, type: !123, flags: DIFlagArtificial | DIFlagObjectPointer)
!463 = !DILocation(line: 0, scope: !248)
!464 = !DILocation(line: 14, column: 3, scope: !248)
!465 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !260, type: !86, flags: DIFlagArtificial | DIFlagObjectPointer)
!466 = !DILocation(line: 0, scope: !260)
!467 = !DILocation(line: 37, column: 7, scope: !260)
!468 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !262, type: !88, flags: DIFlagArtificial | DIFlagObjectPointer)
!469 = !DILocation(line: 0, scope: !262)
!470 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "rule", arg: 2, scope: !262, file: !83, line: 61, type: !86)
!471 = !DILocation(line: 61, column: 22, scope: !262)
!472 = !DILocation(line: 62, column: 119, scope: !262)
!473 = !DILocation(line: 62, column: 127, scope: !262)
!474 = !DILocation(line: 62, column: 141, scope: !262)
!475 = !DILocation(line: 62, column: 160, scope: !262)
!476 = !DILocation(line: 62, column: 166, scope: !262)
!477 = !DILocation(line: 62, column: 149, scope: !262)
!478 = !DILocation(line: 62, column: 171, scope: !262)
!479 = !DILocation(line: 62, column: 147, scope: !262)
!480 = !DILocation(line: 62, column: 177, scope: !262)
!481 = !DILocation(line: 62, column: 183, scope: !262)
!482 = !DILocation(line: 62, column: 5, scope: !262)
!483 = !DILocation(line: 63, column: 18, scope: !262)
!484 = !DILocation(line: 63, column: 5, scope: !262)
!485 = !DILocation(line: 63, column: 11, scope: !262)
!486 = !DILocation(line: 63, column: 16, scope: !262)
!487 = !DILocation(line: 64, column: 14, scope: !262)
!488 = !DILocation(line: 64, column: 5, scope: !262)
!489 = !DILocation(line: 64, column: 12, scope: !262)
!490 = !DILocation(line: 65, column: 3, scope: !262)
!491 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !263, type: !276, flags: DIFlagArtificial | DIFlagObjectPointer)
!492 = !DILocation(line: 0, scope: !263)
!493 = !DILocation(line: 47, column: 5, scope: !263)
!494 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !264, type: !276, flags: DIFlagArtificial | DIFlagObjectPointer)
!495 = !DILocation(line: 0, scope: !264)
!496 = !DILocation(line: 47, column: 5, scope: !264)
!497 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !266, type: !274, flags: DIFlagArtificial | DIFlagObjectPointer)
!498 = !DILocation(line: 0, scope: !266)
!499 = !DILocation(line: 74, column: 7, scope: !266)
!500 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !267, type: !274, flags: DIFlagArtificial | DIFlagObjectPointer)
!501 = !DILocation(line: 0, scope: !267)
!502 = !DILocation(line: 74, column: 7, scope: !267)
!503 = !DILocation(line: 0, scope: !269)
