; ModuleID = '../../cpp/atomicc.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.Module = type { %class.Rule*, %class.Module*, i64 }
%class.Rule = type { i32 (...)**, %class.Rule* }

$_ZN6Module3runEv = comdat any

@stop_main_program = global i32 0, align 4
@_ZN6Module5firstE = global %class.Module* null, align 8
@.str = private unnamed_addr constant [15 x i8] c"%s: module %p\0A\00", align 1
@__FUNCTION__._Z16run_main_programv = private unnamed_addr constant [17 x i8] c"run_main_program\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"     RDY %p\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"     ENA %p\0A\00", align 1

; Function Attrs: nounwind
define void @_Z16run_main_programv() #0 {
entry:
  %curmod = alloca %class.Module*, align 8
  br label %while.cond, !dbg !39

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32, i32* @stop_main_program, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  %lnot = xor i1 %tobool, true, !dbg !43
  br i1 %lnot, label %while.body, label %while.end.4, !dbg !39

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %class.Module** %curmod, metadata !44, metadata !46), !dbg !47
  %1 = load %class.Module*, %class.Module** @_ZN6Module5firstE, align 8, !dbg !48
  store %class.Module* %1, %class.Module** %curmod, align 8, !dbg !47
  br label %while.cond.1, !dbg !49

while.cond.1:                                     ; preds = %while.body.3, %while.body
  %2 = load %class.Module*, %class.Module** %curmod, align 8, !dbg !50
  %tobool2 = icmp ne %class.Module* %2, null, !dbg !50
  br i1 %tobool2, label %while.body.3, label %while.end, !dbg !49

while.body.3:                                     ; preds = %while.cond.1
  %3 = load %class.Module*, %class.Module** %curmod, align 8, !dbg !53
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @__FUNCTION__._Z16run_main_programv, i32 0, i32 0), %class.Module* %3), !dbg !55
  %4 = load %class.Module*, %class.Module** %curmod, align 8, !dbg !56
  call void @_ZN6Module3runEv(%class.Module* %4), !dbg !56
  %5 = load %class.Module*, %class.Module** %curmod, align 8, !dbg !57
  %next = getelementptr inbounds %class.Module, %class.Module* %5, i32 0, i32 1, !dbg !58
  %6 = load %class.Module*, %class.Module** %next, align 8, !dbg !58
  store %class.Module* %6, %class.Module** %curmod, align 8, !dbg !59
  br label %while.cond.1, !dbg !49

while.end:                                        ; preds = %while.cond.1
  br label %while.cond, !dbg !39

while.end.4:                                      ; preds = %while.cond
  ret void, !dbg !60
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
define linkonce_odr void @_ZN6Module3runEv(%class.Module* %this) #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Module*, align 8
  %currule = alloca %class.Rule*, align 8
  store %class.Module* %this, %class.Module** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Module** %this.addr, metadata !61, metadata !46), !dbg !62
  %this1 = load %class.Module*, %class.Module** %this.addr
  call void @llvm.dbg.declare(metadata %class.Rule** %currule, metadata !63, metadata !46), !dbg !64
  %rfirst = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !65
  %0 = load %class.Rule*, %class.Rule** %rfirst, align 8, !dbg !65
  store %class.Rule* %0, %class.Rule** %currule, align 8, !dbg !64
  br label %while.cond, !dbg !66

while.cond:                                       ; preds = %if.end, %entry
  %1 = load %class.Rule*, %class.Rule** %currule, align 8, !dbg !67
  %tobool = icmp ne %class.Rule* %1, null, !dbg !67
  br i1 %tobool, label %while.body, label %while.end, !dbg !66

while.body:                                       ; preds = %while.cond
  %2 = load %class.Rule*, %class.Rule** %currule, align 8, !dbg !70
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), %class.Rule* %2), !dbg !72
  %3 = load %class.Rule*, %class.Rule** %currule, align 8, !dbg !73
  %4 = bitcast %class.Rule* %3 to i1 (%class.Rule*)***, !dbg !73
  %vtable = load i1 (%class.Rule*)**, i1 (%class.Rule*)*** %4, !dbg !73
  %vfn = getelementptr inbounds i1 (%class.Rule*)*, i1 (%class.Rule*)** %vtable, i64 0, !dbg !73
  %5 = load i1 (%class.Rule*)*, i1 (%class.Rule*)** %vfn, !dbg !73
  %call2 = call zeroext i1 %5(%class.Rule* %3), !dbg !73
  br i1 %call2, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %while.body
  %6 = load %class.Rule*, %class.Rule** %currule, align 8, !dbg !76
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), %class.Rule* %6), !dbg !78
  %7 = load %class.Rule*, %class.Rule** %currule, align 8, !dbg !79
  %8 = bitcast %class.Rule* %7 to void (%class.Rule*)***, !dbg !79
  %vtable4 = load void (%class.Rule*)**, void (%class.Rule*)*** %8, !dbg !79
  %vfn5 = getelementptr inbounds void (%class.Rule*)*, void (%class.Rule*)** %vtable4, i64 1, !dbg !79
  %9 = load void (%class.Rule*)*, void (%class.Rule*)** %vfn5, !dbg !79
  call void %9(%class.Rule* %7), !dbg !79
  br label %if.end, !dbg !80

if.end:                                           ; preds = %if.then, %while.body
  %10 = load %class.Rule*, %class.Rule** %currule, align 8, !dbg !81
  %next = getelementptr inbounds %class.Rule, %class.Rule* %10, i32 0, i32 1, !dbg !82
  %11 = load %class.Rule*, %class.Rule** %next, align 8, !dbg !82
  store %class.Rule* %11, %class.Rule** %currule, align 8, !dbg !83
  br label %while.cond, !dbg !66

while.end:                                        ; preds = %while.cond
  ret void, !dbg !84
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!36, !37}
!llvm.ident = !{!38}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !27, globals: !32)
!1 = !DIFile(filename: "../../cpp/atomicc.cpp", directory: "/home/jca/s/git/atomicc/examples/echo")
!2 = !{}
!3 = !{!4, !26}
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Module", file: !5, line: 51, size: 192, align: 64, elements: !6, identifier: "_ZTS6Module")
!5 = !DIFile(filename: "../../cpp/atomicc.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!6 = !{!7, !9, !11, !15, !16, !20, !23}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "rfirst", scope: !"_ZTS6Module", file: !5, line: 77, baseType: !8, size: 64, align: 64, flags: DIFlagPublic)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Rule", size: 64, align: 64)
!9 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !"_ZTS6Module", file: !5, line: 78, baseType: !10, size: 64, align: 64, offset: 64, flags: DIFlagPublic)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !"_ZTS6Module", file: !5, line: 80, baseType: !12, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 62, baseType: !14)
!13 = !DIFile(filename: "/scratch/jca/git/llvm/build/Debug+Asserts/bin/../lib/clang/3.7.0/include/stddef.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!14 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "first", scope: !"_ZTS6Module", file: !5, line: 81, baseType: !10, flags: DIFlagPublic | DIFlagStaticMember)
!16 = !DISubprogram(name: "Module", scope: !"_ZTS6Module", file: !5, line: 54, type: !17, isLocal: false, isDefinition: false, scopeLine: 54, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19, !12}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!20 = !DISubprogram(name: "addRule", linkageName: "_ZN6Module7addRuleEP4Rule", scope: !"_ZTS6Module", file: !5, line: 61, type: !21, isLocal: false, isDefinition: false, scopeLine: 61, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !19, !8}
!23 = !DISubprogram(name: "run", linkageName: "_ZN6Module3runEv", scope: !"_ZTS6Module", file: !5, line: 66, type: !24, isLocal: false, isDefinition: false, scopeLine: 66, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !19}
!26 = !DICompositeType(tag: DW_TAG_class_type, name: "Rule", file: !5, line: 37, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS4Rule")
!27 = !{!28, !31}
!28 = !DISubprogram(name: "run_main_program", linkageName: "_Z16run_main_programv", scope: !1, file: !1, line: 25, type: !29, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @_Z16run_main_programv, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null}
!31 = !DISubprogram(name: "run", linkageName: "_ZN6Module3runEv", scope: !"_ZTS6Module", file: !5, line: 66, type: !24, isLocal: false, isDefinition: true, scopeLine: 66, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Module*)* @_ZN6Module3runEv, declaration: !23, variables: !2)
!32 = !{!33, !35}
!33 = !DIGlobalVariable(name: "stop_main_program", scope: !0, file: !1, line: 24, type: !34, isLocal: false, isDefinition: true, variable: i32* @stop_main_program)
!34 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!35 = !DIGlobalVariable(name: "first", linkageName: "_ZN6Module5firstE", scope: !0, file: !1, line: 37, type: !10, isLocal: false, isDefinition: true, variable: %class.Module** @_ZN6Module5firstE, declaration: !15)
!36 = !{i32 2, !"Dwarf Version", i32 4}
!37 = !{i32 2, !"Debug Info Version", i32 3}
!38 = !{!"clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)"}
!39 = !DILocation(line: 27, column: 5, scope: !28)
!40 = !DILocation(line: 27, column: 13, scope: !41)
!41 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 2)
!42 = !DILexicalBlockFile(scope: !28, file: !1, discriminator: 1)
!43 = !DILocation(line: 27, column: 12, scope: !28)
!44 = !DILocalVariable(tag: DW_TAG_auto_variable, name: "curmod", scope: !45, file: !1, line: 28, type: !10)
!45 = distinct !DILexicalBlock(scope: !28, file: !1, line: 27, column: 32)
!46 = !DIExpression()
!47 = !DILocation(line: 28, column: 17, scope: !45)
!48 = !DILocation(line: 28, column: 26, scope: !45)
!49 = !DILocation(line: 29, column: 9, scope: !45)
!50 = !DILocation(line: 29, column: 16, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 2)
!52 = !DILexicalBlockFile(scope: !45, file: !1, discriminator: 1)
!53 = !DILocation(line: 30, column: 41, scope: !54)
!54 = distinct !DILexicalBlock(scope: !45, file: !1, line: 29, column: 24)
!55 = !DILocation(line: 30, column: 1, scope: !54)
!56 = !DILocation(line: 31, column: 13, scope: !54)
!57 = !DILocation(line: 32, column: 22, scope: !54)
!58 = !DILocation(line: 32, column: 30, scope: !54)
!59 = !DILocation(line: 32, column: 20, scope: !54)
!60 = !DILocation(line: 35, column: 1, scope: !28)
!61 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !31, type: !10, flags: DIFlagArtificial | DIFlagObjectPointer)
!62 = !DILocation(line: 0, scope: !31)
!63 = !DILocalVariable(tag: DW_TAG_auto_variable, name: "currule", scope: !31, file: !5, line: 67, type: !8)
!64 = !DILocation(line: 67, column: 13, scope: !31)
!65 = !DILocation(line: 67, column: 23, scope: !31)
!66 = !DILocation(line: 68, column: 7, scope: !31)
!67 = !DILocation(line: 68, column: 14, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !5, discriminator: 2)
!69 = !DILexicalBlockFile(scope: !31, file: !5, discriminator: 1)
!70 = !DILocation(line: 69, column: 25, scope: !71)
!71 = distinct !DILexicalBlock(scope: !31, file: !5, line: 68, column: 23)
!72 = !DILocation(line: 69, column: 1, scope: !71)
!73 = !DILocation(line: 70, column: 15, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !5, line: 70, column: 15)
!75 = !DILocation(line: 70, column: 15, scope: !71)
!76 = !DILocation(line: 71, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !5, line: 70, column: 31)
!78 = !DILocation(line: 71, column: 1, scope: !77)
!79 = !DILocation(line: 72, column: 15, scope: !77)
!80 = !DILocation(line: 73, column: 11, scope: !77)
!81 = !DILocation(line: 74, column: 21, scope: !71)
!82 = !DILocation(line: 74, column: 30, scope: !71)
!83 = !DILocation(line: 74, column: 19, scope: !71)
!84 = !DILocation(line: 76, column: 3, scope: !31)
