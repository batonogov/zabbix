import os, time


path = '/var/log/cron'
now = time.time()
days = 7

# Удаление файлов старше 7 суток
def del_old_files(path):
   os.chdir(path)
   for root, dirs, files in os.walk('.', topdown = False):
      for name in files:
         file_name = os.path.join(root, name)
         mtime = os.path.getmtime(file_name)
         if now - mtime > (days * 86400):
            os.remove(file_name)
            print('Удалил', file_name)

# Удаление пустых папок
def del_empty_dirs(path):
   for dirs in os.listdir(path):
      a = os.path.join(path, dirs)
      if os.path.isdir(a):
         del_empty_dirs(a)
         if not os.listdir(a):
            os.rmdir(a)
            print(a, 'удалена')

del_old_files(path)
del_empty_dirs(path)
