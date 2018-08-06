

@echo off
set bNull=0
set rootPath=%cd%
@echo %rootPath%
if "%1"=="" set bNull=1
if "%2"=="" set bNull=1
if "%3"=="" set bNull=1
if "%bNull%"=="1" (goto null_data) else ( if exist %rootPath% (goto exist_data) else ( goto module_null) )

:exist_data
set package_name=%1
call :lowercase %2 var
set lowercase_class_name=%var%
set package_path=%package_name:.=\%
set relative_path=%package_path%\%lowercase_class_name%
@echo %lowercase_class_name%

if "%4" == "-M" (set current_path=%rootPath%\src\main\java\%package_path%) else (set current_path=%rootPath%\src\main\java\%relative_path%)

if "%4" == "-M" (set package=%1) else (set package=%1.%lowercase_class_name%)

if "%4" == "-M" (set mergeInterfacePath=mvpinterface\%lowercase_class_name%interface) else (set mergeInterfacePath=%lowercase_class_name%interface)

if "%4" == "-M" (set mergeInterfacePackage=mvpinterface.%lowercase_class_name%interface) else (set mergeInterfacePackage=%lowercase_class_name%interface)

@echo %relative_path%
@echo %current_path%
@echo %mergeInterfacePackage%


md %current_path%
md %current_path%\view
md %current_path%\presenter
md %current_path%\model
md %current_path%\entity
md %current_path%\%mergeInterfacePath%

if "%3"=="-F" (
(
echo package %package%.view;
echo.
echo import android.support.v4.app.Fragment;
echo.
echo import %package%.%mergeInterfacePackage%.I%2Presenter;
echo import %package%.%mergeInterfacePackage%.I%2View;
echo import %package%.presenter.Imp%2Presenter;
echo.
echo public class %2Fragment extends Fragment implements I%2View{
echo     private final I%2Presenter i%2Presenter = new Imp%2Presenter^(this^);
echo.
echo }
)>>%current_path%\view\%2Fragment.java
)

if "%3"=="-A" (
(
echo package %package%.view;
echo.
echo import android.support.v4.app.FragmentActivity;
echo.
echo import %package%.%mergeInterfacePackage%.I%2Presenter;
echo import %package%.%mergeInterfacePackage%.I%2View;
echo import %package%.presenter.Imp%2Presenter;
echo.
echo public class %2Activity extends FragmentActivity implements I%2View{
echo     private final I%2Presenter i%2Presenter = new Imp%2Presenter^(this^);
echo.
echo }
)>>%current_path%\view\%2Activity.java
)

if "%3"=="-V" (
(
echo package %package%.view;
echo.
echo import %package%.%mergeInterfacePackage%.I%2Presenter;
echo import %package%.%mergeInterfacePackage%.I%2View;
echo import %package%.presenter.Imp%2Presenter;
echo.
echo public class %2View implements I%2View{
echo     private final I%2Presenter i%2Presenter = new Imp%2Presenter^(this^);
echo.
echo }
)>>%current_path%\view\%2View.java
)

(
echo package %package%.presenter;
echo.
echo import %package%.%mergeInterfacePackage%.I%2Model;
echo import %package%.%mergeInterfacePackage%.I%2Presenter;
echo import %package%.%mergeInterfacePackage%.I%2View;
echo import %package%.model.Imp%2Model;
echo.
echo public class Imp%2Presenter implements I%2Presenter {
echo     private final I%2Model i%2Model = new Imp%2Model^(this^);
echo     private final I%2View i%2View;
echo.
echo     public Imp%2Presenter^(I%2View i%2View^) {
echo         this.i%2View = i%2View;
echo     }
echo }
)>>%current_path%\presenter\Imp%2Presenter.java

(
echo package %package%.model;
echo.
echo import %package%.%mergeInterfacePackage%.I%2Model;
echo import %package%.%mergeInterfacePackage%.I%2Presenter;
echo.
echo public class Imp%2Model implements I%2Model {
echo     private final I%2Presenter i%2Presenter;
echo.
echo     public Imp%2Model^(I%2Presenter i%2Presenter^) {
echo         this.i%2Presenter = i%2Presenter;
echo     }
echo }
)>>%current_path%\model\Imp%2Model.java

(
echo package %package%.%mergeInterfacePackage%;
echo.
echo public interface I%2View {
echo.
echo }
)>>%current_path%\%mergeInterfacePath%\I%2View.java

(
echo package %package%.%mergeInterfacePackage%;
echo.
echo public interface I%2Presenter {
echo.
echo }
)>>%current_path%\%mergeInterfacePath%\I%2Presenter.java

(
echo package %package%.%mergeInterfacePackage%;
echo.
echo public interface I%2Model {
echo.
echo }
)>>%current_path%\%mergeInterfacePath%\I%2Model.java

@echo Generate [%1] [%2]'s VPM related documents is finish.
@echo Attention: (1) If you can not see the [%2] in IDE, please check whether the generation was successful and try refresh by manually
@echo            (2) Maybe you need to manually change file encoding to UTF-8 (for CI)
@echo            (3) If you add new Activity, you should manually update AndroidManifest.xml to bind
goto :eof

:module_null
@echo Module[%1] is not exist.
goto :eof

:null_data
@echo Please input the right format.
@echo Format: generate_viper [Package Name] [Scenes Name] [UI type]
@echo PS:Module must be exist.
@echo PS:UI type use -A(for Activity) -F(for Fragment) -V(for empty View)
goto :eof

:lowercase
setlocal enabledelayedexpansion&set $=&set "#=@%~1"
for %%a in (a b c d e f g h i j k l m n o p q r s t u v w x y z)do set #=!#:%%a=%%a!
endlocal&set "%~2=%#:~1%"&exit/b