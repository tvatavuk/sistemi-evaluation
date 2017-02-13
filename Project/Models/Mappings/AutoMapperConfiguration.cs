using AutoMapper;
using SistemiEvaluation.Entities;
using SistemiEvaluation.Models;

namespace SistemiEvaluation.Models.Mappings
{
    public class AutoMapperConfiguration
    {
        public static void Configure()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Slider, SliderVM>();
                cfg.CreateMap<Content, ContentVM>();

                cfg.CreateMap<ContentVM, Content>();
                cfg.CreateMap<SliderVM, Slider>();

                cfg.CreateMap<SliderUploadVM, Slider>();
                cfg.CreateMap<ContentUploadVM, Content>();

            });
        }
    }
}
