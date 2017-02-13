using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SistemiEvaluation.Models
{
    public class SaveFileHelper
    {
        public static string SaveFileToDisk(IHostingEnvironment _env, byte[] fileBytes, string fileName, string contentType)
        {

            string uploadsDir = Path.Combine(_env.WebRootPath, "images");
            string dateNow = DateTime.Now.ToString("yyyy-MM-dd_hh-mm-ss-tt");
            string filePathSaved = String.Format("{0}\\{1}_{2}", uploadsDir, dateNow, fileName);
            System.IO.File.WriteAllBytes(filePathSaved, fileBytes);
            string savePath = String.Format("{0}{1}_{2}", "/images/", dateNow, fileName);
            return savePath;
        }
    }
}
