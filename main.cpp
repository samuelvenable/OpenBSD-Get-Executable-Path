/*

 MIT License
 
 Copyright © 2026 Samuel Venable
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

#include "exe-path/exe-path.hpp"
#include <cerrno>
#include <cstdio>
#include <cstring>
#include <cstdlib>

int main(int argc, char **argv) {
  std::string exe;
  int process_id = -1;
  if (argc > 1) {
    process_id = std::atoi(argv[1]);
  }
  exe = get_executable_path(process_id);
  bool failed = exe.empty();
  if (!failed) {
    printf("get_executable_path(%d) result: %s\n", process_id, exe.c_str());
  } else {
    printf("get_executable_path(%d) error: %s\n", process_id, strerror(errno));
  }
  return failed;
}
