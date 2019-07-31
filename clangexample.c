#include<clang-c/Index.h>


#include<stdlib.h> 
#include<stdio.h> 
#include<string.h> 

const char* getCursorKindName( enum CXCursorKind cursorKind )
{
  CXString kindName  = clang_getCursorKindSpelling( cursorKind );
 const char* result = clang_getCString( kindName );

  clang_disposeString( kindName );
  return result;
}

const char* getCursorSpelling( CXCursor cursor )
{
  CXString cursorSpelling = clang_getCursorSpelling( cursor );
 const char* result      = clang_getCString( cursorSpelling );

//  clang_disposeString( cursorSpelling );
  return result;
}
clang_getTypedefDeclUnderlyingType


enum CXChildVisitResult visitor( CXCursor cursor, CXCursor parent, CXClientData clientData ) {
  CXSourceLocation location = clang_getCursorLocation( cursor );
  if( clang_Location_isFromMainFile( location ) == 0 )
    return CXChildVisit_Continue;

  enum CXCursorKind cursorKind = clang_getCursorKind( cursor );

  unsigned int curLevel  = (unsigned int)( clientData );
  unsigned int nextLevel = curLevel + 1;

  printf(" %d %s %s \n", curLevel, getCursorKindName(cursorKind ), getCursorSpelling( cursor ));

  clang_visitChildren( cursor,
                       visitor,
                       &nextLevel ); 

  return CXChildVisit_Continue;
}


int main (void) {
  CXIndex index = clang_createIndex(0, 0);
  CXTranslationUnit unit = clang_parseTranslationUnit(
    index,
    "/usr/include/signal.h", NULL, 0,
    NULL, 0,
    CXTranslationUnit_None);
  if (unit == NULL)
  {
    printf("Unable to parse translation unit. Quitting.");
    exit(-1);
  }
  unsigned int treeLevel = 0;
  clang_visitChildren(clang_getTranslationUnitCursor(unit),
                    visitor, &treeLevel);

  clang_disposeTranslationUnit(unit);
  clang_disposeIndex(index);
}










