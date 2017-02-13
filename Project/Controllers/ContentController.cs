using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using SistemiEvaluation.Data.Abstract;
using SistemiEvaluation.Models;
using SistemiEvaluation.Entities;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

// For more information on enabling Web API for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemiEvaluation.API.Controllers
{
    //[Route("api/[controller]")]
    [Route("api/content")]
    public class ContentController : Controller
    {
  

        private IContentRepository _contentRepository;
        private IHostingEnvironment _env;

        //int page = 1;
        //int pageSize = 10;
        public ContentController(IContentRepository contentRepository, IHostingEnvironment env)
        {
            _contentRepository = contentRepository;
            _env = env;
        }

        [HttpGet]
        public IActionResult Get()
        {
            IEnumerable<Content> _items = _contentRepository
                   .GetAll()
                   .ToList();

            IEnumerable<ContentVM> _contentVM = Mapper.Map<IEnumerable<ContentVM>>(_items);

            //Response.AddPagination(page, pageSize, totalUsers, totalPages);

            return new OkObjectResult(_contentVM);
        }

        [HttpGet("{id}", Name = "GetContent")]
        public IActionResult Get(int id)
        {
            Content _category = _contentRepository.GetSingle(u => u.Id == id);

            if (_category != null)
            {
                ContentVM _categoryVM = Mapper.Map<ContentVM>(_category);
                return new OkObjectResult(_categoryVM);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost]
        public IActionResult Create(ContentUploadVM ContentUploadVM, IFormFile file)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (file != null)
            {
                using (Stream stream = file.OpenReadStream())
                {
                    using (BinaryReader br = new BinaryReader(stream))
                    {
                        var fileContent = br.ReadBytes((int)file.Length);
                        ContentUploadVM.Image = SaveFileHelper.SaveFileToDisk(_env, fileContent, file.FileName, file.ContentType);
                    }
                }
            }


            Content _newContent = Mapper.Map<Content>(ContentUploadVM);

            _contentRepository.Add(_newContent);
            _contentRepository.SaveChanges();

            CreatedAtRouteResult result = CreatedAtRoute("GetContent", new { controller = "Content", id = ContentUploadVM.Id }, ContentUploadVM);
            return result;
        }

        [HttpPut]
        public IActionResult Update(ContentUploadVM ContentUploadVM, IFormFile file)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (file != null)
            {
                using (Stream stream = file.OpenReadStream())
                {
                    using (BinaryReader br = new BinaryReader(stream))
                    {
                        var fileContent = br.ReadBytes((int)file.Length);
                        ContentUploadVM.Image = SaveFileHelper.SaveFileToDisk(_env, fileContent, file.FileName, file.ContentType);
                    }
                }
            }
            Content _sliderDb = _contentRepository.GetSingle(ContentUploadVM.Id);

            if (_sliderDb == null)
            {
                return NotFound();
            }

            Mapper.Map(ContentUploadVM, _sliderDb);

            _contentRepository.SaveChanges();

            return new NoContentResult();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Content _categoryDb = _contentRepository.GetSingle(id);

            if (_categoryDb == null)
            {
                return new NotFoundResult();
            }
            else
            {
                _contentRepository.Delete(_categoryDb);

                _contentRepository.SaveChanges();

                return new NoContentResult();
            }
        }
    }
}
